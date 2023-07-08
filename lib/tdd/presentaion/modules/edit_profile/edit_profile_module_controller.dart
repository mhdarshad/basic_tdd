
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/entities/edit_profile/edit_profile_modle.dart';
import '../../../domain/entities/vx_store.dart';
import '../../../domain/usecase/edit_profile/edit_profile_usecase.dart';

class EditProfileModuleEvent
    extends LogicHandler<EditProfileModuleUseCase, EditProfileModuleDatas> {
  TextEditingController yourNameController = TextEditingController(text:stored.userdata.custName);
  TextEditingController myBioController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String? Function(BuildContext, String?)? yourNameControllerValidator;

  EditProfileModuleEvent(super.usecase);

  @override
  call({required EditProfileModuleDatas data}) {
    // TODO: implement call
    return EditProfileModuleMutation(usecase, data);
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
