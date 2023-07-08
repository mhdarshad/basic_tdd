import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
typedef UseCaseData = DashBoardUseCase;
class   DashboardEvent extends LogicHandler<UseCaseData, NoPrams>{
  DashboardEvent(super.usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
 return  PlansListMutation(usecase, data);
  }
}
class PlansListMutation extends EventMutations<NoPrams>  {
  UseCaseData usecase;
  PlansListMutation(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);
    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        store?.dashboard = r;
      });
    }
  }
}