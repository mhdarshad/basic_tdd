import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
import '../../../domain/usecase/scedule/scedule_usecase.dart';
import '../../../domain/usecase/trainer/trainer_usecase.dart';
typedef UseCaseData = TrainersUseCase;
class   TrainerEvent extends LogicHandler<UseCaseData, PlanFetchData>{
  TrainerEvent(super.usecase);

  @override
  call({required PlanFetchData data}) {
    // TODO: implement call
     return  TrainerMutation(usecase, data);
  }
}

class TrainerMutation extends EventMutations<PlanFetchData>  {
  UseCaseData usecase;
  TrainerMutation(this.usecase, PlanFetchData data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);

    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        store?.trainerData = r;
      });
    }
  }
}
class PlanFetchData{
  final String? planId;
  const PlanFetchData({ this.planId});
}