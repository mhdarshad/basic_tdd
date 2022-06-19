/*
import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/cripto_algo.dart';
import '../../../../core/data/hive_db.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/user/login_user.dart';
import '../../../domain/repositories/repository_provider.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';

class UpdateUserBloc extends LogicHandler<PhoneLoginUseCase, NoPrams> {
  PhoneLoginUseCase usecase;

  UpdateUserBloc(this.usecase) : super(usecase);
  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return UpdateUserEvents(usecase, data);
  }
}

class UpdateUserEvents extends EventMutations<NoPrams> {
  PhoneLoginUseCase usecase;

  UpdateUserEvents(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase.repo.getLocalDBRequest(LDBParams(methed: DB.GET,table: DBTable.UserProfile, key: 'user'));
    request.fold((l) => throw CacheFailure(), (r) async{
      if (kDebugMode) {
        print(" user data: $r");
      }
      final UsersData userData = UsersData.fromJson(r);
      final request = await usecase.repo.getRequest(Params( uri: Uri.parse('user/${userData.user?.uid}'), methed: 'GET'));
      request.fold((l) => Left(l), (r) async{
        if (kDebugMode) {
          print("user data: ${UsersData.fromJson(r).toJson()}");
        }

        sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
        if(UsersData.fromJson(r).tocken!=null) {
          if (kDebugMode) {
            print("Save New Token");
          }
          sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(UsersData.fromJson(r).tocken??""));
        }else{
          if (kDebugMode) {
            print("continue old Token");
          }
        }
        final user = await usecase.repo.getLocalDBRequest(LDBParams(methed: DB.SET,table: DBTable.UserProfile,data: UsersData.fromJson(r).toJson(), key: 'user'));
        sl<SharedPreferences>().setString(SFkeys.UType,'user');
        sl<SharedPreferences>().setString(SFkeys.UID,UsersData.fromJson(r).user?.uid??"");
        store?.UserData = UsersData.fromJson(r);
      });
    });
  }
}*/
