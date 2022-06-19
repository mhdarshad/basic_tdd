import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../../injection_container.dart';
import '../../../../../rought_genrator.dart';
import '../../../../domain/usecase/phoneauth/login_usecase.dart';

class AdminLogin extends StatelessWidget with GoNavigations{
  AdminLogin({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,

      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            alignment: const AlignmentDirectional(0, 0),
            child: VxNotifier(mutations: {
              // PhoneRegisterEvents : (ctx,mut){
              //   if(mut.status == VxStatus.success){
              //     GNavigation(context, type: NavigatoreTyp.pushReplacment,name: Routename.Home);
              //   }
              // },

            },
                child:Container(
                  // width: 400,
                  // height: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // boxShadow: [
                    //   // BoxShadow(
                    //   //   blurRadius: 1,
                    //   //   color: Color(0x3600000F),
                    //   //   offset: Offset(0, -1),
                    //   // )
                    // ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: /*PageView(
                      controller: _pageviewcontroller,
                      physics: const NeverScrollableScrollPhysics(),
                      children:[
                        AuthPhone(textController: textController, contrycode: CountryCode(code: '+91')),
                        AuthOtp(confirm,textController: textController, onBackTap: ()=> _pageviewcontroller.previousPage(duration: const Duration(seconds: 1), curve: Curves.ease),),
                        AuthRegister(credential),
                      ],
                    )*/Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [BoxShadow(blurRadius: 60)],
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                    ),
                    // height: MediaQuery.of(context).size.height/3,
                    child: FlutterLogin(
                      theme: LoginTheme(accentColor:Theme.of(context).accentColor,primaryColor: Theme.of(context).primaryColor,cardTheme: const CardTheme(elevation: 18)),
                      // title: 'Asfa',
                      // logo: AssetImage('assets/icon/logo.jpeg'),
                      hideForgotPasswordButton: true,
                      loginAfterSignUp: true,
                      userType: LoginUserType.email,
                      showDebugButtons: true,
                      messages: LoginMessages(
                        userHint: 'Email Address',
                        passwordHint: 'Password',
                        confirmationCodeHint: 'Confirm',
                        confirmPasswordHint: 'Confirm Password',
                        loginButton: 'LOG IN',
                        signupButton: 'REGISTER',
                      ),
                      userValidator: (value){
                        var phoneRegExp = RegExp(
                            '^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$');
                        if (value != null &&
                            value.length < 4 /*&&
                            !phoneRegExp.hasMatch(value)*/) {
                          return "This isn't a valid Email id";
                        }
                        return null;
                      },


                      // loginProviders: [],
                      onLogin: (logindata) async {
                        if(logindata.name == 'admin@asfahbm.com'&& logindata.password == 'admin@123'){
                          Future.delayed(const Duration(seconds: 2),() {
                            sl<SharedPreferences>().setString(SFkeys.UType,'admin');
                            GNavigation(context, type: NavigatoreTyp.pushReplacment,name: Routename.Home,parms: {'index':'dashboard','user':'admin'});
                          },);

                        }else {
                          return 'Invalid Credentials';
                        }
                        // Future.value('n');
                      },
                      onSubmitAnimationCompleted: () {
                        GNavigation(context, type: NavigatoreTyp.pushReplacment,name: Routename.Home,parms: {'index':'dashboard','user':'admin'});
                        // Navigator.of(context).pushNamedAndRemoveUntil(RoutName.dashboard, (route) => false);
                      }, onRecoverPassword: (String ) {

                    },
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
