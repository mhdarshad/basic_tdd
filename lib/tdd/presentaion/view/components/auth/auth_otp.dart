import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../injection_container.dart';
import '../../../events/auth/phone_otp_mutation.dart';

class AuthOtp extends StatelessWidget {
  final TextEditingController textController;
  final _formkey = GlobalKey<FormState>();
  Function() onBackTap;
  ConfirmationResult? confirm;

  AuthOtp(this.confirm, {Key? key,required this.textController,required this.onBackTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      autovalidateMode:  AutovalidateMode.always,
      child: Column(mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children:   [
        GestureDetector(
          onTap: ()=>onBackTap(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 40),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textController.text,style: const TextStyle(fontSize: 20),),
                const Icon(Icons.edit)
              ],
            ),
          ),
        ),
        OTPTextField(
          // controller: ocontroller,
          length: 6,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 40,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          style:  TextStyle(
              backgroundColor: Theme.of(context).primaryColor.withAlpha(30),
              fontSize: 10
          ),
          textFieldAlignment: MainAxisAlignment.center,
          fieldStyle: FieldStyle.box,
          // onChanged: (pin){
          //
          // },
          onCompleted: (pin) {
            print("Completed: " + pin);
            if(confirm!=null){
              sl<PhoneOtpBloc>()(data: PhoneOtpModle(pin,confirm!));
            }else{
              if (kDebugMode) {
                print("number not confirmed");
              }
            }
          },
        ),
        // Visibility(visible: true,child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        //   child: MaterialButton(onPressed: ()=>widget.onSubmit(ocontroller),
        //     textColor: Colors.white,color: Colors.deepPurpleAccent.shade700,padding: const EdgeInsetsDirectional.all(10),
        //     elevation: 3,child: Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 8.0),
        //       child: Row(mainAxisAlignment: MainAxisAlignment.center,
        //         children: const [
        //           Text("Continue",style: TextStyle(fontSize: 20),),
        //         ],
        //       ),
        //     ),),
        // )),
        "haven't received yet?".text.make().px64().py12()
      ],),
    );
  }
}