

import 'package:cloud_me_v2/core/cripto_algo.dart';
import 'package:cloud_me_v2/core/util/presentation/constants/ic_constants.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/data/models/exception_modle.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
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
  ChangePasswordUseCase changepassUseCase;


  GetUserController(this.usecase,this.verifyOtpUseCase,this.signUpUseCase,this.changepassUseCase) : super(usecase);
  // State field(s) for emailAddress widget.
  static  TextEditingController? phoneNumberController = TextEditingController();
  static  TextEditingController? reEnterpasswordController = TextEditingController();
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
  static ValueNotifier<bool> changePass = ValueNotifier(false);
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
  changePassInit(){
    changePass.value = false;
  }
  signUp(){
    return GetUserEvents(signUpUseCase, SignUpData(userFirstname: firstNameController?.text??'',userSecondname:lastNameController?.text??"", password:  passwordController?.text??"",  dateOfBirth: dateController.value.toString(),  gender: dropDownValue.value??'', emaile: emailAddressController?.text??'', phone: phoneNumberController?.value.text??'', phoneCode: contryCode));
  }

  static void initState(BuildContext context) {
    passwordVisibility.value = false;
    contryCode = '+971' ;
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

  verifyOTP() => GetUserEvents(verifyOtpUseCase,OTPData(OTPType.SignUp,phone: phoneNumberController?.text??'',otp: pinCodeController?.text));

  static void setOtpvalue(bool bool) {
    showOtp.value = true;
    showOtp.notifyListeners();
  }

  void otpReSend() {
    GetUserEvents(verifyOtpUseCase,OTPData(OTPType.SignUp,phone: phoneNumberController?.text??''));
  }

  forgetPasswordOTPSend() {
    GetUserEvents(verifyOtpUseCase,OTPData(OTPType.forgetPass,phone: phoneNumberController?.text??''));
  }


  void forgetPasswordverifyOTP() {
    GetUserEvents(verifyOtpUseCase,OTPData(OTPType.forgetPass,phone: phoneNumberController?.text??'',otp: pinCodeController?.text));
  }

  static void showChangepassword() {
    changePass.value = true;
    changePass.notifyListeners();
  }

  changepassword() {
    GetUserEvents(changepassUseCase,ChangePassData(passwordController?.text??''));
  }
}

class GetUserEvents extends EventMutations<AuthParamsAbstarct> {
  UseCase usecase;
  GetUserEvents(this.usecase, AuthParamsAbstarct data) : super(data);
  bool otpVerified= false;
  bool otpSent= false;
  bool passwordUpdated= false;
  @override
  perform() async {
    final request = await usecase(data:data);

    if(usecase  is OtpUseCase ) {
      print("Its Veryfy Use Case");
      if (!request.isLeft()) {
        if(data is OTPData){
          if((data as OTPData).otp!=null){
            if((data as OTPData).otpType == OTPType.SignUp) {
              request.forEach((r) {
                otpVerified = true;
                if (kDebugMode) {
                  print("customer ID: ${r['customer_id']}");
                }
                sl<Configration>().custTocken = r['customer_auth'].toString().encript;
                sl<Configration>().custId =r['customer_id'].toString();
              });
            }else{
              request.forEach((r) {
                print("OTP Verified Success From API $r" );
                otpVerified = true;
                // sl<Configration>().cid = r['cus_id'];
              });
            }
          }else{
            request.forEach((r) {
              sl<Configration>().cid = r['cus_id'];
              print("OTP Sent  :${r['cus_id']}");
              otpSent = true;
            });
          }

        }
      }
      else{
        errorToast("Number not Registered");
        // request.leftMap((l) =>throw l);
      }
      return;
    }
    if(usecase  is ChangePasswordUseCase ) {
      (data as ChangePassData);
      if (!request.isLeft()) {
        if (kDebugMode) {
          print(sl<Configration>().cid);
        }
        passwordUpdated = true;
      }else{
        errorToast("Number not Registered");
        // request.leftMap((l) =>throw l);
      }
      return;
    }
    else if (usecase is LoginUseCase){
      if(!request.isLeft()){
        if (kDebugMode) {
          print("logged in");
        }
        request.forEach((r) {
          final UserAcsessData result = r;
          sl<SharedPreferences>().setString(SFkeys.token, result.customerAuth?.encript??'');
          sl<SharedPreferences>().setString(SFkeys.UID, result.customerID.toString());
          sl<Configration>().custId = result.customerID.toString();
          sl<Configration>().custTocken = result.customerAuth?.encript;
          store?.userdata = result.customer;
        });
      }else{
        errorToast("Credential mismatch");
        // request.leftMap((l) => throw l);
      }
    }
    else if (usecase is SingUpUseCase){
      if(!request.isLeft()){
        if (kDebugMode) {
          print("logged in");
        }
        request.forEach((r) {
          if (kDebugMode) {
            print(r);
          }
          final UserAcsessData result = r;
          sl<Configration>().custTocken = result.customerAuth?.encript;
          sl<Configration>().cid = result.customer.id;
          store?.userdata = result.customer;
        });
      } else{
        sl<Configration>().cid = null;
        errorToast("Phone number already registered");
        // throw ServerExceptions(400,ExceptiomModle(message: "Phone number already registered",errors: {}));
      }
    }
  }
}