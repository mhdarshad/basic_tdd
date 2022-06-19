import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:asspa/tdd/domain/entities/analitics/user_analitics.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/cripto_algo.dart';
import '../../../../core/data/hive_db.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/user/login_user.dart';
import '../../../domain/repositories/repository_provider.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';
import 'setuser_store.dart';

class   GetUserBloc extends LogicHandler<PhoneLoginUseCase, NoPrams> {
  PhoneLoginUseCase usecase;

  GetUserBloc(this.usecase) : super(usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return GetUserEvents(usecase, data);
  }

}

class GetUserEvents extends EventMutations<NoPrams> {
  PhoneLoginUseCase usecase;

  GetUserEvents(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    UsersData userData = UsersData();
    final request = await usecase.repo.getLocalDBRequest(LDBParams(methed: DB.GET,table: DBTable.UserProfile, key: 'user'));

    request.fold((l) => throw CacheFailure(), (r) async{
      if (kDebugMode) {
        print(" users data: $r");
      }
      userData = UsersData.fromJson(r);
    });
    if(userData.user?.uid!=null) {
      final analitics = await usecase.repo.getRequest(Params(methed: 'GET',uri: Uri.parse('user/analitics/${userData.user?.uid}')));
      final request = await usecase.repo.getRequest(Params( uri: Uri.parse('user/${userData.user?.uid}'), methed: 'GET'));
      analitics.fold((l) => Left(l), (r) => store?.usersAnalytics = Analytics.fromJson(r['data']));
      request.fold((l) => Left(l), (r) async{
        if (kDebugMode) {
          print("user data: ${UserData.fromJson(r).data?.first.toJson()}");
        }
        final user = await usecase.repo.getLocalDBRequest(LDBParams(methed: DB.SET,table: DBTable.UserProfile,data: UserData.fromJson(r).data?.first.toJson(), key: 'user'));
        sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
        if(UserData.fromJson(r).data?.first.tocken!=null) {
          if (kDebugMode) {
            print("Save New Token");
          }
          sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(UserData.fromJson(r).data?.first.tocken??""));
        }else{
          if (kDebugMode) {
            print("continue old Token");
          }
        }
        sl<SharedPreferences>().setString(SFkeys.UType,'user');
        sl<SharedPreferences>().setString(SFkeys.UID,UserData.fromJson(r).data?.first.user?.uid??"");
        store?.UserData = UserData.fromJson(r).data!.first;
      });
    }else{
      store?.UserData = userData;
    }
  }
}