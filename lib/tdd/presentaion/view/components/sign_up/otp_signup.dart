
import 'package:cloud_me_v2/core/util/presentation/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/login/login_form_consumer.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/screens/home/home_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_widgets.dart';
import '../../../../../injection_container.dart';
import '../../../modules/login/login_form_controller.dart';
import 'package:flutter/material.dart';

class SignupOtp extends StatefulWidget {
  const SignupOtp({Key? key}) : super(key: key);

  @override
  _SignupOtpState createState() =>
      _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
    GetUserController.initState(context);
  }

  @override
  void dispose() {
    GetUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<bool>(
          valueListenable: GetUserController.showOtp,
          builder: (context,otpSent,_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhoneEditText(isReadOnly: otpSent,),
              otpSent?Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 32),
                child: PinCodeTextField(
                  autoDisposeControllers: false,
                  appContext: context,
                  length: 6,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  enableActiveFill: false,
                  autoFocus: true,
                  enablePinAutofill: false,
                  errorTextSpace: 0,
                  showCursor: true,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  obscureText: false,
                  hintCharacter: '-',
                  pinTheme: PinTheme(
                    fieldHeight: 60,
                    fieldWidth: 60,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(12),
                    shape: PinCodeFieldShape.box,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    inactiveColor: FlutterFlowTheme.of(context).primaryBackground,
                    selectedColor: FlutterFlowTheme.of(context).secondaryText,
                    activeFillColor: FlutterFlowTheme.of(context).primary,
                    inactiveFillColor: FlutterFlowTheme.of(context).primaryBackground,
                    selectedFillColor: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  controller: GetUserController.pinCodeController,
                  onChanged: (_) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: GetUserController.pinCodeControllerValidator?.asValidator(context),
                ),
              ):const SizedBox.shrink(),
              otpSent?LoginFormConsumer(
                  builder: (context,store,state) {
                    return CustomeButton  (
                      color:FlutterFlowTheme.of(context).primary,
                      borderColor: Colors.transparent,
                      onPressed: ()=>sl<GetUserController>().verifyOTP(),
                      text: 'Verify',);
                  }
              ):
              VxConsumer(
                  mutations: const {GetUserEvents},
                  notifications: {
                    GetUserEvents:(ctx, store, {status}) {
                      if(status == VxStatus.success){
                        if((store as GetUserEvents).otpVerified) {
                          navigate.pushReplace(context, name: Routename.home,parms: {
                            'page': BotemNavigations.dashboard.name
                          });
                        }
                      }else if(status == VxStatus.error){
                        GetUserController.initState(context);
                      }
                    }
                  },
                  builder: (context,store,status) {
                  return CustomeButton(color:FlutterFlowTheme.of(context).secondaryBackground,
                    borderColor:  FlutterFlowTheme.of(context).alternate,
                    onPressed: () =>   sl<GetUserController>().signUp(), text: 'Send OTP',);
                }
              ),
              // CustomeButton(color:FlutterFlowTheme.of(context).secondaryBackground,
              //   borderColor:  FlutterFlowTheme.of(context).secondaryText,
              //   onPressed: () {
              //   navigate.pushReplace(context, name: Routename.login);
              //   }, text: 'Sign In',),
              // Column(
              //   mainAxisSize: MainAxisSize.max,
              //   children: [
              //     Align(
              //       alignment: const AlignmentDirectional(0.0, 0.0),
              //       child: Padding(
              //         padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
              //         child: Text(
              //           'Or sign up with',
              //           textAlign: TextAlign.center,
              //           style: FlutterFlowTheme.of(context).labelMedium,
              //         ),
              //       ),
              //     ),
              //     Align(
              //       alignment: const AlignmentDirectional(0.0, 0.0),
              //       child: Padding(
              //         padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              //         child: Wrap(
              //           spacing: 16.0,
              //           runSpacing: 0.0,
              //           alignment: WrapAlignment.center,
              //           crossAxisAlignment: WrapCrossAlignment.center,
              //           direction: Axis.horizontal,
              //           runAlignment: WrapAlignment.center,
              //           verticalDirection: VerticalDirection.down,
              //           clipBehavior: Clip.none,
              //           children: const [],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          );
        }
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  final dynamic Function()? onPressed;
  final Color? color;
  final Color? borderColor;
  final String text;
  const CustomeButton({
    super.key,
    required this. onPressed,
    this.color, this.borderColor, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
        child: FFButtonWidget(
          onPressed: onPressed,
          text: text,
          options: FFButtonOptions(
            width: 230.0,
            height: 44,
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: color,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
            ),
            elevation: 3.0,
            borderSide: borderColor!=null? BorderSide(
              color:borderColor!,
              width: 2,
            ):BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}

class PhoneEditText extends StatelessWidget {
 final bool isReadOnly;

  const PhoneEditText({
    super.key,this.isReadOnly =false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          readOnly: isReadOnly,
          controller:  GetUserController.phoneNumberController,
          autofocus: true,
          // autofillHints: const [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            prefix: !isReadOnly? CountryCodePicker(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              padding: EdgeInsets.zero,
              onChanged:GetUserController.onContryChange,
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: '+971',
              favorite: const ['+971','UAE'],
              // optional. Shows only country name and flag
              showCountryOnly: true,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              alignLeft: false,
            ):GetUserController.contryCode.text.make(),
            labelStyle: FlutterFlowTheme.of(context).labelMedium,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            contentPadding:
            const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
          keyboardType: TextInputType.phone,
          validator:
          GetUserController.emailAddressControllerValidator?.asValidator(context),
        ),
      ),
    );
  }
}
