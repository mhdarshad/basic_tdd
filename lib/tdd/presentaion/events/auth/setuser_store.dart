import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:asspa/tdd/domain/repositories/repository_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/cripto_algo.dart';
import '../../../../core/data/hive_db.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/user/login_user.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';

class SetUserBloc extends LogicHandler<PhoneLoginUseCase, UsersData> {
  PhoneLoginUseCase usecase;

  SetUserBloc(this.usecase) : super(usecase);

  @override
  call({required UsersData data,required}) {
    // TODO: implement call
    return SetUserEvents(usecase, data);
  }

}

class PhoneLoginModle {
  late String phone;
  late String password;

  PhoneLoginModle(this.phone,this.password);
}

class SetUserEvents extends EventMutations<UsersData> {
  PhoneLoginUseCase usecase;


  SetUserEvents(this.usecase, UsersData data) : super(data);

  @override
  perform() async {
    print("Updating user data: ${data?.toJson()??{}}");
    final user = await usecase.repo.getLocalDBRequest(LDBParams(methed: DB.SET,table: DBTable.UserProfile,data: data?.toJson()??{}, key: 'user'));

    sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
    if(data?.tocken!=null) {
      if (kDebugMode) {
        print("Save New Token");
      }
      sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(data?.tocken??""));
    }else{
      if (kDebugMode) {
        print("continue old Token");
      }
    }
    sl<SharedPreferences>().setString(SFkeys.UType,'user');
    sl<SharedPreferences>().setString(SFkeys.UID,data?.user?.uid??"");
    store?.UserData = data!;
  }
}