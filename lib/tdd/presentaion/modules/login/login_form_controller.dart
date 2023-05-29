

import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../../core/util/presentation/flutter_flow/form_field_controller.dart';
import '../../../../injection_container.dart';
import '../../../domain/repositories/repository_provider.dart';
import '../../../domain/usecase/db/db_insert_usecase.dart';
import '../../../domain/usecase/auth/user_login.dart';
import '../database_module/do_congig_module.dart';
import 'login_form_interfrence.dart';

class   GetUserController extends LogicHandler<LoginUseCase, LoginData> with GetUserInterference{
  LoginUseCase usecase;


  GetUserController(this.usecase) : super(usecase);
  // State field(s) for emailAddress widget.
  static  TextEditingController? phoneNumberController = TextEditingController();
  static  TextEditingController? emailAddressController = TextEditingController();
  static TextEditingController? pinCodeController= TextEditingController();
  static TextEditingController? passwordController = TextEditingController();
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
  static onContryChange(CountryCode code){
    contryCode = code.code??'0';
}

   static login(context) {
    // TODO: implement login
     print("User name: $phoneNumberController");
    // throw UnimplementedError();
     navigate.push(context, name: Routename.home);
    //  sl<GetUserController>()(data:LoginData(username: emailAddressController?.text??'', password:  passwordController?.text??"", key: "key") );
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

  static fetchotp(BuildContext context) {
    showOtp.value = true;
    showOtp.notifyListeners();
  }
}

class GetUserEvents extends EventMutations<LoginData> {
  LoginUseCase usecase;

  GetUserEvents(this.usecase, LoginData data) : super(data);

  @override
  perform() async {
    // final request = await usecase(data:data);
   // if(!request.isLeft()){
   //   // request.forEach((r) {
   //   //   next(() => DBCongigMutation(DBInsertUseCase(repo: usecase.repo as DependencyRepostProvider<Map<String, dynamic>>),r));
   //   // });
   // }
  }
}