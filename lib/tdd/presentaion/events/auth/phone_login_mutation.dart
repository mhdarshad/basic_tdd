import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/cripto_algo.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../domain/entities/user/login_user.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';
import 'setuser_store.dart';

/// Currently Not Used Directly Taken From Login Screen
class PhoneLoginBloc extends LogicHandler<PhoneLoginUseCase, PhoneLoginModle> {
  PhoneLoginUseCase usecase;

  PhoneLoginBloc(this.usecase) : super(usecase);

  @override
  call({required PhoneLoginModle data}) {
    // TODO: implement call
    return PhoneLoginEvents(usecase, data);
  }

}


class PhoneLoginEvents extends EventMutations<PhoneLoginModle> {
  PhoneLoginUseCase usecase;


  PhoneLoginEvents(this.usecase, PhoneLoginModle data) : super(data);

  @override
 perform() async {
     Either<Failure, UsersData> request = await usecase.login(data: data!);
     UsersData datas = UsersData();
     request.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print("logedin data: ${r.toJson()}");
      }
      datas = r;
      // sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
      // if(r.tocken!=null) {
      //   sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(r.tocken!));
      // }
    });
     next(() => SetUserEvents(usecase,datas));
    // return Future.value(store?.UserData);
  }
}