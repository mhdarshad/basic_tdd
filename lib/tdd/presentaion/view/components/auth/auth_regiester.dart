import 'package:asspa/tdd/presentaion/events/phoneauth/phone_register_mutation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../injection_container.dart';

class AuthRegister extends StatelessWidget {
  final UserCredential? credential;

  TextEditingController textController_emaile = TextEditingController(text: "");
  TextEditingController textController_fname = TextEditingController(text: "");
  TextEditingController textController_lname = TextEditingController(text: "");

  AuthRegister(this.credential, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: textController_fname,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter First Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xCF042BEC),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: Theme.of(context).inputDecorationTheme.counterStyle,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: textController_lname,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter First Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xCF042BEC),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: Theme.of(context).inputDecorationTheme.counterStyle,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: textController_emaile,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter First Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xCF042BEC),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: Theme.of(context).inputDecorationTheme.counterStyle,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  print('Button pressed ...');
                  sl<PhoneRegisterBloc>()(data: PhoneRegisterModle(fname: textController_fname.text,lname: textController_lname.text,email: textController_emaile.text,phone: credential?.user?.phoneNumber??"",ftocken: credential?.credential?.token.toString()??"",ip: "", uid: credential?.user?.uid??"",password: textController_fname.text));
                },
                child: const Text("Submit",style: TextStyle(color: Colors.white),),
                minWidth: 100,
                height: 40,
                color: Theme.of(context).primaryColor,
                shape: Border.all(style: BorderStyle.solid,width: 1,color: Colors.transparent),
                // options: FFButtonOptions(
                //   width: 130,
                //   height: 40,
                //   color: Theme.of(context).primaryColor,
                //   // textStyle: FlutterFlowTheme.of(context)
                //   //     .subtitle2
                //   //     .override(
                //   //   fontFamily: 'Poppins',
                //   //   color: Colors.white,
                //   // ),
                //   borderSide: const BorderSide(
                //     color: Colors.transparent,
                //     width: 1,
                //   ),
                //   borderRadius: 12,
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
