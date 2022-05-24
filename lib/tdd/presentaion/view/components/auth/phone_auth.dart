import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../injection_container.dart';
import '../../../events/phoneauth/phone_login_mutation.dart';

class AuthPhone extends StatelessWidget {
  final TextEditingController textController;

  CountryCode contrycode ;

  AuthPhone({Key? key,required this.textController,required this.contrycode}) : super(key: key);

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
            children: [
              Padding(
                padding:
                const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: IconButton(
                  color: const Color(0xFFE0E3E7),
                  splashRadius: 30,
                  // borderWidth: 1,
                  iconSize: 44,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF57636C),
                    size: 24,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              const Text(
                'Phone Sign In',
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
              SizedBox(
                // width: 80,
                child: CountryCodePicker(
                  onChanged: (val)=> contrycode = val,
                  flagWidth: 20,
                  enabled: false,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  favorite: const ['+91','IN'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter Phone Number',
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
                  final String text = "+91"+textController.text;
                  print('Button pressed ..${/*_contrycode.code??"+91"+*/text}.');
                  // sl<PhoneLoginBloc>()(data: PhoneLoginModle(/*_contrycode.code??"+91"+*/text));
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
