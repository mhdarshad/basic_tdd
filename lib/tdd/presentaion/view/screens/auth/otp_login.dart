
import 'package:rising_gym/tdd/presentaion/view/components/sign_up/otp_signup.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/config/user_config.dart';
import '../../../../../core/util/presentation/template/custom_scafold.dart';
import '../../../../../injection_container.dart';
import '../../../../../rought_genrator.dart';
import '../../../../domain/usecase/auth/user_login.dart';
import '../../../modules/login/login_form_controller.dart';
import '../home/home_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  @override
  Widget build(BuildContext context) {
    return  ProjectScafold(
      displayLogoHead:true,
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: OTPVerificationContainer(onBackPress: (bool isotpSent) {
        if(isotpSent){
          GetUserController.showOtp.value = false;
          GetUserController.showOtp.notifyListeners();
        }else{
          navigate.pop(context);
        }
      }, onClickResendOtp: (){
        sl<GetUserController>().otpReSend();
      }, onClickVerifyOtp: (){
        sl<GetUserController>().verifyOTP();
      }, onOtpVeryfiedStatus: (onVerified){
        if(onVerified){
          navigate.pushReplace(context, name: Routename.home,parms: {
            'page': BottemNavigationsData.dashboard.name
          });
        }else{
          // GetUserController.initState(context);
        }
      }, onSignUpStatus: (){
        GetUserController.setOtpvalue(true);
      }, onClickSendOtp: ()=>  sl<GetUserController>().signUp(),),
    ),);
  }
}



