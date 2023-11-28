import 'package:rising_gym/tdd/data/entities/api/pland/plans_trainer_data.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/plan_and_trainer_detail/plan_and_trainer_usecase.dart';


class PlanTrainerDetailEvent
    extends LogicHandler<PlanTrainerDetailUseCase, String> {
  PlanTrainerDetailEvent(super.usecase);

  @override
  call({required String data}) {
    // TODO: implement call
    return PlanTrainerDetailMutation(usecase, data);
  }

}

class PlanTrainerDetailMutation extends EventMutations<String> {
  PlanTrainerDetailUseCase usecase;

  String? err;

  PlanTrainerDetailMutation(this.usecase, String data)
      : super(data);

  @override
  perform() async {
    final request = await usecase(data: data);
    if (!request.isLeft()) {
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        store?.plandata = r;
      });
    }
  }
}