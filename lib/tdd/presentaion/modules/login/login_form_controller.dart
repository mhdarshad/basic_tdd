

import 'package:cloud_me_v2/core/cripto_algo.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../../core/util/presentation/flutter_flow/form_field_controller.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/user/user_data.dart';
import '../../../domain/repositories/repository_provider.dart';
import '../../../domain/usecase/db/db_insert_usecase.dart';
import '../../../domain/usecase/auth/user_login.dart';
import '../database_module/do_congig_module.dart';
import 'login_form_interfrence.dart';

class   GetUserController extends LogicHandler<LoginUseCase, LoginData> with GetUserInterference{
  LoginUseCase usecase;
  OtpUseCase verifyOtpUseCase;
  SingUpUseCase signUpUseCase;


  GetUserController(this.usecase,this.verifyOtpUseCase,this.signUpUseCase) : super(usecase);
  // State field(s) for emailAddress widget.
  static  TextEditingController? phoneNumberController = TextEditingController();
  static  TextEditingController? emailAddressController = TextEditingController();
  static  TextEditingController? firstNameController = TextEditingController();
  static  TextEditingController? lastNameController = TextEditingController();
  static TextEditingController? pinCodeController= TextEditingController();
  static TextEditingController? passwordController = TextEditingController();
  static ValueNotifier<DateTime?> dateController = ValueNotifier(null);
  static String? Function(BuildContext, String?)? emailAddressControllerValidator;
  static String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  static String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for password widget.

  static  ValueNotifier<bool> passwordVisibility = ValueNotifier(false);
  passwordVisiblity(bool value){
    print("password");
    passwordVisibility.value =value;
    passwordVisibility.notifyListeners();
  }
  static late String contryCode ;
  static ValueNotifier<bool> showOtp = ValueNotifier(false);
  static ValueNotifier<String?> dropDownValue = ValueNotifier(null);

  static FormFieldController<String>? dropDownValueController;
  // void dispose() {
  //   pinCodeController?.dispose();
  // }

  @override
  call({required LoginData data}) {
    // TODO: implement call
    return GetUserEvents(usecase, data);
  }

  static onContryChange(CountryCode code)=> contryCode = code.code??'0';
  static login() {
    // TODO: implement login
    if (kDebugMode) {
      print("User name: ${phoneNumberController?.value.text}");
    }
    // throw UnimplementedError();
    sl<GetUserController>()(data:LoginData(username: phoneNumberController?.text??'', password:  passwordController?.text??"", key: "key") );
  }
  signUp(){
    showOtp.value = true;
    showOtp.notifyListeners();
    return GetUserEvents(signUpUseCase, SignUpData(userFirstname: firstNameController?.text??'',userSecondname:lastNameController?.text??"", password:  passwordController?.text??"",  dateOfBirth: dateController.value.toString(),  gender: dropDownValue.value??'', emaile: emailAddressController?.text??'', phone: phoneNumberController?.value.text??'', phoneCode: contryCode));
  }

  static void initState(BuildContext context) {
    passwordVisibility.value = false;
    contryCode = '+91' ;
    phoneNumberController ??= TextEditingController();
    pinCodeController = TextEditingController();
    passwordController ??= TextEditingController();
  }
  static void dispose() {
    // phoneNumberController?.dispose();
    // passwordController?.dispose();
  }
  static void selectDOB(DateTime? date){
    dateController.value = date;
    dateController.notifyListeners();
  }

  verifyOTP() => GetUserEvents(verifyOtpUseCase,OTPData(phone: phoneNumberController?.text??'',otp: pinCodeController?.text));
}

class GetUserEvents extends EventMutations<AuthParamsAbstarct> {
  UseCase usecase;
  GetUserEvents(this.usecase, AuthParamsAbstarct data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);

    if(usecase  is OtpUseCase ){
      request.forEach((r) {
        if (kDebugMode) {
          print(r['error']);
        }
      });
      return;
    } else if (usecase is LoginUseCase){
      if(!request.isLeft()){
        if (kDebugMode) {
          print("logged in");
        }
        request.forEach((r) {
          final UserAcsessData result = r;
          sl<Configration>().custTocken = result.customerAuth.encript;
          sl<Configration>().custId = result.customer.id;
          store?.userdata =result.customer;
        });
      }else{
        errorToast("Credential mismatch");
      }
    }else if (usecase is SingUpUseCase){
      if(!request.isLeft()){
        if (kDebugMode) {
          print("logged in");
        }
        request.forEach((r) {
          if (kDebugMode) {
            print(r);
          }
        });
      }else{
        errorToast("Credential mismatch");
      }
    }
  }
}