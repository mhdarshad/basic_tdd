import 'package:cloud_me_v2/core/util/presentation/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/login/login_form_consumer.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_widgets.dart';
import '../../../../../injection_container.dart';
import '../../../modules/login/login_form_controller.dart';
import 'package:flutter/material.dart';

import '../../widgets/textForm/custome_form_edit_text.dart';
import '../../widgets/textForm/form_text_filed.dart';

class LoginFormComponent2Widget extends StatefulWidget {
  const LoginFormComponent2Widget({Key? key}) : super(key: key);

  @override
  _LoginFormComponent2WidgetState createState() =>
      _LoginFormComponent2WidgetState();
}

class _LoginFormComponent2WidgetState extends State<LoginFormComponent2Widget> {

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PhoneNumberContainer(labelText: 'Phone Number',),
           const PasswordEditText(),
          LoginFormConsumer(
            builder: (context,store,state) {
              return CustomeButton(

                color:FlutterFlowTheme.of(context).primary,
                borderColor: Colors.transparent,
                onPressed: ()=>GetUserController.login(context), text: 'Sign In',);
            }
          ),
          CustomeButton(color:FlutterFlowTheme.of(context).secondaryBackground,
            borderColor:  FlutterFlowTheme.of(context).secondaryText,
            onPressed: () {
              navigate.pushReplace(context, name: Routename.signup);
          }, text: 'Sign Up',),
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
