import 'package:asspa/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../rought_genrator.dart';
import '../../../../domain/usecase/phoneauth/login_usecase.dart';
import '../../../events/auth/phone_register_mutation.dart';
import '../../../events/auth/set_admin.dart';
import '../../../events/auth/setuser_store.dart';

class PhoneAuth extends StatefulWidget {
  final String? ref;
  const PhoneAuth({Key? key, this.ref}) : super(key: key);

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> with GoNavigations{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController textController;
  final PageController _pageviewcontroller = PageController(initialPage: 0);
  ConfirmationResult? confirm;
  UserCredential? credential;
  PhoneRegisterModle? registerModle;
  ConfirmationResult? conformation;

  String? lname;
  String? fname;
  String? email;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this HomePage Widget...
      Scaffold(
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
                PhoneRegisterEvents : (ctx,mut, {status}){
                  if(mut.status == VxStatus.success){
                    GNavigation(context, type: NavigatoreTyp.pushReplacment,name: Routename.Home,parms: {'index':'dashboard','user':'user'});
                  }
                },

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
                        theme:  LoginTheme(accentColor:Theme.of(context).accentColor,primaryColor: Theme.of(context).primaryColor,cardTheme: CardTheme(elevation: 18)),
                        // title: 'Asfa',
                        // logo: AssetImage('assets/icon/logo.jpeg'),
                        hideForgotPasswordButton: true,
                        loginAfterSignUp: true,
                        userType: LoginUserType.phone,
                        onResendCode: (v){
                          return null;
                        },
                        showDebugButtons: true,
                        additionalSignupFields: const [
                          // UserFormField(keyName: 'otp',displayName: "Enter OTP",icon: Icon(Icons.password),userType: LoginUserType.phone),
                          UserFormField(keyName: 'fname',displayName: "First Name",icon: Icon(Icons.supervised_user_circle_outlined),userType: LoginUserType.name),
                          UserFormField(keyName: 'lname',displayName: "Last Name",icon: Icon(Icons.supervised_user_circle_outlined),userType: LoginUserType.name),
                          UserFormField(keyName: 'email',displayName: "Enter Email",icon: Icon(Icons.email_outlined),userType: LoginUserType.name),
                        ],
                        messages: LoginMessages(
                          userHint: 'Phone Number',
                          passwordHint: 'Password',
                          confirmationCodeHint: 'Confirm',
                          confirmPasswordHint: 'Confirm Password',
                          loginButton: 'LOG IN',
                          signupButton: 'REGISTER',
                        ),
                        userValidator: (value){
                          var phoneRegExp = RegExp('^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$');
                          if (value != null &&
                              value.length < 7 &&
                              !phoneRegExp.hasMatch(value)) {
                            return "This isn't a valid phone number";
                          }
                          return null;
                        },
                        onConfirmSignup: (otp,logindata) async{
                          try {
                            final userdata = await PhoneLoginUseCase(sll()).otp(conformation!, otp:otp );
                            final  modle =  PhoneRegisterModle(email: email??"", phone:userdata.user!.phoneNumber!,ip: "",ftocken: userdata.user?.refreshToken??"",lname: lname??"",fname: fname??"", uid: userdata.user?.uid??"", password: logindata.password,ref: widget.ref);
                            sl<PhoneRegisterBloc>()(data: modle);
                            VxToast.show(context, msg: "confirmed to signup");
                          } catch (e) {
                            return 'Invalid OTP';
                          }
                          return null;
                        },

                        // loginProviders: [],
                        onLogin: (logindata) async {
                          // sl<PhoneLoginBloc>()(data: PhoneLoginModle(logindata.name,logindata.password));
                          /*  final userdata =  PhoneLoginEvents(PhoneLoginUseCase(sll()),PhoneLoginModle(logindata.name,logindata.password));
                            if(userdata.status == VxStatus.success){

                            }*/
                          final userdata = await PhoneLoginUseCase(sll()).login(data: PhoneLoginModle("+91"+logindata.name,logindata.password));
                          return userdata.fold((l) => 'Invalid Credentials', (r) {
                            sl<SetUserBloc>()(data: r);
                            GNavigation(context, type: NavigatoreTyp.pushReplacment,name: Routename.Home,parms: {'index':'dashboard','user':'user'});
                            return null;
                          });
                          // Future.value('n');
                        },
                        onSignup:(signupdata) async{
                          print("registebutton "+"+91"+signupdata.name!);
                          try {
                            conformation = await  PhoneLoginUseCase(sll()).phoneauth(phone: "+91"+signupdata.name!);
                            // final userdata = await PhoneLoginUseCase(sll()).otp(, otp: '' );
                            if(conformation?.verificationId==null){
                              return Future.value("Check The Phone number Entered");
                            }
                          } catch (e) {
                            return Future.value("Check The Phone number Entered");
                          }
                          fname = signupdata.additionalSignupData?['fname']??"";
                          lname = signupdata.additionalSignupData?['lname']??"";
                          email = signupdata.additionalSignupData?['email']??"";

                          return null;
                        },
                        onSubmitAnimationCompleted: () {
                          // GNavigation(context, type: NavigatoreTyp.pushReplacment,name: Routename.Home,parms: {'index':'dashboard','user':'user'});
                          // Navigator.of(context).pushNamedAndRemoveUntil(RoutName.dashboard, (route) => false);
                        },
                        onRecoverPassword: (val){
                          return null;
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

class PosterContainer extends StatelessWidget {
  const PosterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: const BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      alignment: const AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Theme.of(context).brightness == Brightness.dark)
                  Image.asset(
                    'assets/images/uiLogo_robinLight@3x.png',
                    width: 240,
                    height: 60,
                    fit: BoxFit.fitWidth,
                  ),
                if (!(Theme.of(context).brightness == Brightness.dark) )
                  Image.asset(
                    'assets/icon/logo.jpeg',
                    width: 240,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Image.asset(
              'assets/images/wellcome_workers.png',
              width: 300,
              height: 300,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
