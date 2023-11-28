
import 'dart:convert';

import 'package:rising_gym/core/usecases/usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/modle/contry_data.dart';
import '../../../domain/modle/edit_profile/edit_profile_modle.dart';
import '../../../domain/modle/vx_store.dart';
import '../../../domain/usecase/edit_profile/edit_profile_usecase.dart';
enum EditMethode{
  personal,professional, emiratesid
}
class EditProfileModuleEvent  extends LogicHandler<EditProfileModuleUseCase, NoPrams> {
  static TextEditingController yourNameController = TextEditingController();
  static TextEditingController myBioController = TextEditingController();
  static TextEditingController custCity = TextEditingController();
  static TextEditingController cityController = TextEditingController();
  static TextEditingController companynameController = TextEditingController();
  static TextEditingController emergencyAddressController = TextEditingController();
  static TextEditingController emergencynumberController = TextEditingController();
  static ValueNotifier<String?> selectedContry = ValueNotifier(contry.where((element) => element['name'] == stored.userdata?.custCountry).firstOrNull?['key'].toString());
  static String? emerateIdImageString;
  static String? profileImageString;

  EditProfileModuleEvent(super.usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    final name = yourNameController.text;
    final conry = contry.where((e) => e['key'] == selectedContry.value).firstOrNull;
    final address = myBioController.text;
    final state = cityController.text;
    final conpanyname = companynameController.text;
    final emergencyNumber = emergencynumberController.text;
    final emergencyAddress = emergencyAddressController.text;

    return EditProfileModuleMutation(usecase, EditProfileModuleDatas(
      name:name,
      contry:(conry?['name']).toString(),
      address:address,
      state:state,
      profilePic:profileImageString,
      emeratesId:emerateIdImageString,
      companyName:conpanyname,
      emergencyNumber:emergencyNumber,
      emergencyAddress:emergencyAddress,
    ));
  }

  static initialState(EditMethode methode){
    yourNameController.clear();
    myBioController.clear();
    custCity.clear();
    companynameController.clear();
    emergencyAddressController.clear();
    emergencynumberController.clear();
    emerateIdImageString= null;
    profileImageString= null;
    if(methode == EditMethode.personal){
      yourNameController.text = stored.userdata?.custName??'';
      myBioController.text = stored.userdata?.custAdd1??'';
      custCity.text = stored.userdata?.custState??'';
    }else if(methode == EditMethode.professional){
      companynameController.text = stored.userdata?.company??'';
      emergencyAddressController.text = stored.userdata?.custEmergencyAddress??'';
      emergencynumberController.text = stored.userdata?.custEmergencyNumber??'';
    }else if(methode == EditMethode.emiratesid){
      // EditProfileModuleMutation(usecase, EditProfileModuleDatas(emeratesId: encodedImage));
    }
  }

  static void selectContry(String? value) {
    selectedContry.value = value;
    selectedContry.notifyListeners();
  }

  void setEmeratesId(String encodedImage) {
    emerateIdImageString = encodedImage;
  }

  void setProfile(String encodedImage) {
    profileImageString = encodedImage;
  }
}

class EditProfileModuleMutation extends EventMutations<EditProfileModuleDatas> {
  EditProfileModuleUseCase usecase;
  var err;

  EditProfileModuleMutation(this.usecase, EditProfileModuleDatas data)
      : super(data);

  @override
  perform() async {
    final request = await usecase(data: data);
    if (!request.isLeft()) {
      if(kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {

      });
    }
  }
}
