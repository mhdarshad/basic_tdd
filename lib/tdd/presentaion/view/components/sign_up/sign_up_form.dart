import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_me_v2/core/util/presentation/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_me_v2/core/util/presentation/template/custom_scafold.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_drop_down.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/flutter_flow/form_field_controller.dart';
import '../../../../../injection_container.dart';
import '../../../modules/login/login_form_controller.dart';
import '../../widgets/dropdown/project_drop_down_select.dart';
import '../../widgets/expansion_widget/project_custome_expansion.dart';
import '../../widgets/textForm/custome_form_edit_text.dart';
import 'otp_signup.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return ProjectScafold(displayLogoHead:true,child:Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children:  [
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8,right: 8),
                child: CustomeEdittext(labelText: 'First Name',controller:GetUserController.firstNameController),
              )),
              Expanded(child:Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
                child: CustomeEdittext(labelText: 'Last Name',controller:GetUserController.lastNameController),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
            child: SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: GetUserController.emailAddressController,
                autofocus: true,
                autofillHints: const [AutofillHints.email],
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
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
                validator:
                GetUserController.emailAddressControllerValidator?.asValidator(context),
              ),
            ),
          ),
          const PasswordEditText(showForgetPassword:false),
          GestureDetector(
            onTap: () async {
              GetUserController.selectDOB(await showDatePicker(context: context, initialDate:  DateTime.now(), firstDate: DateTime.now().subtract(const Duration(days: 36525)), lastDate: DateTime.now()));
            },
            child: ValueListenableBuilder<DateTime?>(
              valueListenable: GetUserController.dateController,
              builder: (context,store,state) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12, 5, 12, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  store!=null?DateFormat('dd-MM-yyyy').format(store):'Date of Birth',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Icon(
                                  Icons.date_range_outlined,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          child: store!=null?RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Age ',
                                  style:
                                  FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '${AgeCalculator.age(store).years}',
                                  style: FlutterFlowTheme.of(context).titleLarge,
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Urbanist',
                                fontSize: 20,
                              ),
                            ),
                            textAlign: TextAlign.end,
                          ):Container(),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
          ProjectDropDownSelect<String>(onChanged: (val){
            print(val);
            GetUserController.dropDownValue.value = val ;
            GetUserController.dropDownValue.notifyListeners();
          }, values: const [
            "Female","Male"
          ], valueListenable: GetUserController.dropDownValue,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomeButton(
              color:FlutterFlowTheme.of(context).primary,
              borderColor: Colors.transparent,
              onPressed: ()=>sl<GetUserController>().signUp(), text: 'Sign Up',),
          ),
        // Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: ProjectExpansion(
          //               title: 'Personal Details',
          //               discription: Padding(
          //               padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          //               child: Text(
          //                 'Enter The Description of the Title',
          //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
          //                   fontFamily: 'Readex Pro',
          //                   color: FlutterFlowTheme.of(context).secondaryText,
          //                 ),
          //               ),
          //             ), expandedChild:  Column(
          //               mainAxisSize: MainAxisSize.max,
          //               children: const [
          //                 Padding(
          //                   padding: EdgeInsets.all(8.0),
          //                   child: CustomeEdittext(labelText: 'Company Name',),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(8.0),
          //                   child: CustomeEdittext(labelText: 'Company Name',),
          //                 ),
          //               ],
          //             ),),
          //           )
        ],
      ),
    )
    );
  }
}


