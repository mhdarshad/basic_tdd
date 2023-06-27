import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../../data/models/api/user/dashboard_data.dart';
import '../../../domain/entities/plans/subscribed_plans_listing.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
import '../../../domain/usecase/room_scedule/room_scedule_usecase.dart';
import '../../../domain/usecase/scedule/scedule_usecase.dart';
class   RoomSceduleEvent extends LogicHandler<RoomSceduleUseCase, String>{

  RoomSceduleEvent(super.usecase,);

  @override
  call({required String data}) {
    // TODO: implement call
     return  RoomSceduleMutation(usecase, data);
  }
}

class RoomSceduleMutation extends EventMutations<String>  {
  RoomSceduleUseCase usecase;
  RoomSceduleMutation(this.usecase, String data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);
    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) => store?.rooms = r);
    }
  }
}