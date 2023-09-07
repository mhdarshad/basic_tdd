import 'package:rising_gym/core/util/presentation/flutter_flow/flutter_flow_util.dart';
import 'package:rising_gym/rought_genrator.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../injection_container.dart';
import '../../../modules/login/login_form_controller.dart';

class PhoneNumberContainer extends StatelessWidget {
  final String? labelText;

  const PhoneNumberContainer({
    this. labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          controller:  GetUserController.phoneNumberController,
          autofocus: true,
          // autofillHints: const [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            labelText: labelText,
            prefix:  CountryCodePicker(enabled: false,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              padding: EdgeInsets.zero,
              onChanged: print,
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: '+971',
              favorite: const ['+971','UAE'],
              // optional. Shows only country name and flag
              showCountryOnly: true,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              alignLeft: false,
            ),
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
            contentPadding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
          keyboardType: TextInputType.phone,
          validator:GetUserController.phoneNumberControllerValidator?.asValidator(context),
        ),
      ),
    );
  }
}
class CustomeEdittext extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(BuildContext, String?)? validator;
  const CustomeEdittext({
    this. labelText,
    super.key,  this.controller, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        autofocus: true,
        autofillHints: const [AutofillHints.name],
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
          fontFamily: 'Urbanist',
          color: FlutterFlowTheme.of(context).alternate,
        ),
        keyboardType: TextInputType.emailAddress,
        validator:validator?.asValidator(context),
      ),
    );
  }
}
class PasswordEditText extends StatelessWidget {
  const PasswordEditText({
    super.key,
    this.showForgetPassword =true,
  });
final bool showForgetPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: ValueListenableBuilder<bool>(
                valueListenable: GetUserController.passwordVisibility,
                builder: (context,value,_) {
                  return TextFormField(
                    controller:  GetUserController.passwordController,
                    autofillHints: const [AutofillHints.password],
                    obscureText: ! value,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                      suffixIcon: InkWell(
                        onTap: () => sl<GetUserController>().passwordVisiblity( !value),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                    sl<GetUserController>().passwordControllerValidator?.asValidator(context),
                  );
                }
            ),
          ),
          if(showForgetPassword)
          MaterialButton(
            onPressed: ()=>navigate.push(context, name: Routename.resetPassword),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Forget password?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}