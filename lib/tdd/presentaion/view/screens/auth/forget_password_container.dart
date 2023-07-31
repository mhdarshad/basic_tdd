import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/template/custom_scafold.dart';
import '../../../../../injection_container.dart';
import '../../../../../rought_genrator.dart';
import '../../../modules/login/login_form_controller.dart';
import '../../components/sign_up/otp_signup.dart';
import '../../widgets/textForm/custome_form_edit_text.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  void initState() {
    // TODO: implement initState
    sl<GetUserController>().changePassInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    GetUserController.passwordController?.addListener(() {
      sl<GetUserController>().passwordControllerValidator = (context,value){
        return (GetUserController.passwordController?.text != GetUserController.reEnterpasswordController?.text)?'Password Not matching':null;
      };
    });
    return  ProjectScafold(
      displayLogoHead:false,
      child: ValueListenableBuilder<bool>(
          valueListenable: GetUserController.changePass,
          builder: (context,data,_) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: !data?OTPVerificationContainer(onBackPress: (bool isotpSent) {
                if(isotpSent){
                  GetUserController.showOtp.value = false;
                  GetUserController.showOtp.notifyListeners();
                }else{
                  navigate.pop(context);
                }
              }, onClickResendOtp: (){
                // sl<GetUserController>().forgetPasswordotpReSend();
              },
                onClickVerifyOtp: (){

                  sl<GetUserController>().forgetPasswordverifyOTP();

                }, onOtpVeryfiedStatus: (onVerified){
                  if(onVerified){
                    GetUserController.showChangepassword();
                    // navigate.pushReplace(context, name: name);
                  }else{
                    // GetUserController.initState(context);
                  }
                }, onSignUpStatus: ()=> GetUserController.setOtpvalue(true),
                onClickSendOtp: () {
                  GetUserController.setOtpvalue(true);
                  return sl<GetUserController>().forgetPasswordOTPSend();
                },):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
                    child: CustomeEdittext(labelText: 'Change Password',controller:GetUserController.passwordController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
                    child: CustomeEdittext(labelText: 'Re-Enter Password',controller:GetUserController.reEnterpasswordController,validator: sl<GetUserController>().passwordControllerValidator,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: VxConsumer(
                        notifications: {
                          GetUserEvents: (context,store, {status}){
                           if(( store as GetUserEvents).passwordUpdated){
                             showDialog(context: context, builder: (context)=>const AlertDialog(content: Text("Password Changed SSuccessfully"),actions: [
                               Text("Ok")
                             ],));
                           }
                          }
                        },
                        mutations: const {GetUserEvents},
                        builder: (context,store,state) {
                          return CustomeButton(
                            color:FlutterFlowTheme.of(context).primary,
                            borderColor: Colors.transparent,
                            onPressed: () => sl<GetUserController>().changepassword(),
                            text: 'Change',
                          );
                        }
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
