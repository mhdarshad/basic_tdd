import 'package:asspa/core/cripto_algo.dart';
import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:asspa/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../domain/usecase/phoneauth/login_usecase.dart';

class PhoneOtpBloc extends LogicHandler<PhoneLoginUseCase, PhoneOtpModle> {
  PhoneLoginUseCase usecase;

  PhoneOtpBloc(this.usecase) : super(usecase);

  @override
  call({required PhoneOtpModle data}) {
    // TODO: implement call
    return PhoneOtpEvents(usecase, data);
  }

}

class PhoneOtpModle {
  late String otp;
  late ConfirmationResult result;

  PhoneOtpModle(this.otp, this.result);
}

class PhoneOtpEvents extends EventMutations<PhoneOtpModle> {
  PhoneLoginUseCase usecase;

  UserCredential? request;

  PhoneOtpEvents(this.usecase, PhoneOtpModle data) : super(data);

  @override
  perform() async {
   request =  await usecase.otp(data!.result, otp: data!.otp);
  }
}