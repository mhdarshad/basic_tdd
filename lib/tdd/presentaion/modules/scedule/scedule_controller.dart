import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../../data/models/api/user/dashboard_data.dart';
import '../../../domain/entities/plans/subscribed_plans_listing.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
import '../../../domain/usecase/scedule/scedule_usecase.dart';
class   SceduleEvent extends LogicHandler<SceduleUseCase, NoPrams>{
  DashBoardUseCase dashBoardUseCase;

  SceduleEvent(super.usecase, this. dashBoardUseCase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return  SceduleMutation(usecase,dashBoardUseCase, data);
  }
}

class SceduleMutation extends EventMutations<NoPrams>  {
  SceduleUseCase usecase;
  DashBoardUseCase dashBoardUseCase;
  SceduleMutation(this.usecase,this.dashBoardUseCase, NoPrams data) : super(data);

  @override
  perform() async {
    DashBoardData? dashboard;
    List<Scedule>? scedules;
    List<PlansData> plansScedule =[];
    final request = await usecase(data:data);
    final dashboardrequest = await dashBoardUseCase(data:data);
    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        scedules = r;
      });
    }
    if(!dashboardrequest.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      dashboardrequest.forEach((r) {
        dashboard = r;
      });
    }
    dashboard?.subscribedPlans?.forEach((element) => plansScedule.add(PlansData(id: element.id.toString(),title: element.invoiceDetail?.invoiceItemDiscription,classes: scedules?.toList())));
    store?.scedules = scedules??[] ;
  }
}