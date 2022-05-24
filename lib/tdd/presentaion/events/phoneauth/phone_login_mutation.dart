import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Future <Either<Failure, UsersData>> perform() async {
     Either<Failure, UsersData> request = await usecase.login(data: data!);
   return request.fold((l) => Left(l), (r) {
      print("data: ${r.toJson()}");
      store?.UserData = r;
      sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
      sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(r.tocken!));
      return Right(r);
    });
     // return Future.value(store?.UserData);
  }
}