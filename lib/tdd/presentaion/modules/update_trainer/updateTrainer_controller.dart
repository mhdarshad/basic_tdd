import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/screens/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/api/trainers/trainers_data.dart';
import '../../../domain/usecase/update_trainer_usecase/update_trainer_usecase.dart';

class UpdatetrainerEvent
    extends LogicHandler<UpdatetrainerUseCase, PersonalTrainerData> {
  UpdatetrainerEvent(super.usecase);

  @override
  call({required PersonalTrainerData data, BuildContext? context}) {
    // TODO: implement call
    return UpdatetrainerMutation(usecase,context!, data);
  }
}

class UpdatetrainerMutation extends EventMutations<PersonalTrainerData> {
  UpdatetrainerUseCase usecase;
  String? err;
  BuildContext? context;
  UpdatetrainerMutation(this.usecase,this.context, PersonalTrainerData data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data,returnStatus: (data,respone){
      navigate.pushReplace(context!, name: Routename.home,parms: {'page':BottemNavigationsData.dashboard.name});
      respone.forEach((r) {

      });
    });
    if (!request.isLeft()) {
     navigate.pushReplace(context!, name: Routename.home,parms: {'page':BottemNavigationsData.dashboard.name});
      request.forEach((r) {

      });
    }
  }
}

class UpdatetrainerDatas{
  final String invoiceNumber;
  final String transctionId;
  UpdatetrainerDatas({required this.invoiceNumber, required this.transctionId});
}