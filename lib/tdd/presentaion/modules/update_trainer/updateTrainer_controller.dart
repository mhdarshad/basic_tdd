import 'package:flutter/foundation.dart';
import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/update_trainer_usecase/update_trainer_usecase.dart';

class UpdatetrainerEvent
    extends LogicHandler<UpdatetrainerUseCase, UpdatetrainerDatas> {
  UpdatetrainerEvent(super.usecase);

  @override
  call({required UpdatetrainerDatas data}) {
    // TODO: implement call
    return UpdatetrainerMutation(usecase, data);
  }
}

class UpdatetrainerMutation extends EventMutations<UpdatetrainerDatas> {
  UpdatetrainerUseCase usecase;
  String? err;
  UpdatetrainerMutation(this.usecase, UpdatetrainerDatas data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data);
    if (!request.isLeft()) {
      if (kDebugMode) {
        print("logged in");
      }
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