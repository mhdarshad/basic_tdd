import 'package:rising_gym/core/usecases/usecase.dart';
import 'package:rising_gym/tdd/domain/entities/vx_store.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../../data/models/api/user/dash_board_date.dart';
import '../../../data/models/api/user/dashboard_data.dart';
import '../../../domain/entities/plans/subscribed_plans_listing.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
import '../../../domain/usecase/scedule/scedule_usecase.dart';
import '../../../domain/usecase/trainer/trainer_usecase.dart';
import '../trainer/trainer_controller.dart';
class   SceduleEvent extends LogicHandler<SceduleUseCase, FilterData?>{
  DashBoardUseCase dashBoardUseCase;
  TrainersUseCase traineruseCase;
  static ValueNotifier<Map<String,dynamic>?> filterFor = ValueNotifier(null);
  static List<String> filterData = ["Class","Plan","Trainer",];
  SceduleEvent(super.usecase, this. dashBoardUseCase,this.traineruseCase);

  @override
  call({required FilterData? data}) {
    // TODO: implement call
    return  SceduleListMutation(usecase,dashBoardUseCase,traineruseCase, data);
  }

  void getFilterData(String? value) {
    final planForfilter = stored.plan_forfilter?.map((e) => {
      'id':e.itemCode,
      'name':e.invoiceDetails?.first.invoiceItemDiscription}).toList();
    final scedulteForFIlter = stored.scedules.map((e) => {
      'id':e.id,
      'name':e.title}).toList();
    final trainerForFIlter = stored.trainerForFIlter.map((e) => {
      'id':e.addonItem,
      'name':e.itemDescription}).toList();
    Map<String, Map<String, dynamic>> filterValue = {
      "class":{
        'title':"Class",
        'key':'class',
        'data':scedulteForFIlter
      },
      "plan": {
        'title':'Plan',
        'key':'plan',
        'data':planForfilter
      },
      "trainer":{
        'title':'Trainer',
        'key':'trainer',
        'data':trainerForFIlter
      },
      "room":{
        'title':'Room',
        'key':'room',
        'data':trainerForFIlter
      },
    };
   filterFor.value = filterValue[value?.trim().toLowerCase()];
   filterFor.notifyListeners();
  }
}

class SceduleListMutation extends EventMutations<FilterData?>  {
  SceduleUseCase usecase;
  TrainersUseCase traineruseCase;
  DashBoardUseCase dashBoardUseCase;
  SceduleListMutation(this.usecase,this.dashBoardUseCase,this.traineruseCase, FilterData? data) : super(data);

  @override
  perform() async {
    DashBoardData? dashboard;
    List<Scedule>? scedules;
    List<PlansData> plansScedule =[];
    final request = await usecase(data:data);
    final dashboardrequest = await dashBoardUseCase(data:NoPrams());
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
    dashboard?.subscribedPlans?.forEach((element) => plansScedule.add(PlansData(id: element.id.toString(),title: element.invoiceDetails?.first.invoiceItemDiscription,classes: scedules?.toList())));
    store?.plan_forfilter =  dashboard?.subscribedPlans;
    store?.trainerForFIlter.clear();
    store?.plan_forfilter?.forEach((element) async{
      final resultData = await traineruseCase(data:PlanFetchData(planId: element.itemCode.toString()));
      resultData.forEach((r) {
        store?.trainerForFIlter.addAll(r);
      });
    });
    store?.scedules = scedules??[];
  }
}

class FilterData{
  final String type;
  final String id;
  FilterData(this.type, this.id);
}