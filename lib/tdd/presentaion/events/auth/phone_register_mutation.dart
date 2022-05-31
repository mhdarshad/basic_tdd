import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/cripto_algo.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../../rought_genrator.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';
import 'setuser_store.dart';

class PhoneRegisterBloc
    extends LogicHandler<PhoneLoginUseCase, PhoneRegisterModle> {
  PhoneLoginUseCase usecase;

  PhoneRegisterBloc(this.usecase) : super(usecase);

  @override
  call({required PhoneRegisterModle data}) {
    // TODO: implement call
    return PhoneRegisterEvents(usecase, data);
  }

}

class PhoneRegisterEvents extends EventMutations<PhoneRegisterModle> {
  PhoneLoginUseCase usecase;

  PhoneRegisterEvents(this.usecase, PhoneRegisterModle data) : super(data);

  @override
  perform() async {
    final request = await usecase.regester(data: data!);
    request.fold((l) => Left(l), (r) {
      print("data: ${r.toJson()}");
      store?.UserData = r;
      next(() => PhoneLoginEvents(usecase,r));
      // sl<SharedPreferences>().setBool(SFkeys.LOGEDIN,true);
      // sl<SharedPreferences>().setString(SFkeys.token,Cripto().encript(r.tocken!));
      // sl<SharedPreferences>().setString(SFkeys.UType,'user');
      // sl<SharedPreferences>().setString(SFkeys.UID,r.user?.uid??"");
      return Right(r);
    });
  }
}

class PhoneRegisterModle {
  String fname;
  String uid;
  String lname;
  String phone;
  String password;
  String ip;
  String ftocken;
  String email;
  String? ref;
  PhoneRegisterModle({required this.fname, required this.uid, required this.password, required this.lname, required this.phone, required this.ip, required this.ftocken, required this.email,this.ref});
}