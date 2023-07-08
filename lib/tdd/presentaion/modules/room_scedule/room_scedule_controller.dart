import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/screens/home/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../../data/models/api/user/dashboard_data.dart';
import '../../../domain/entities/plans/subscribed_plans_listing.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
import '../../../domain/usecase/room_scedule/room_scedule_usecase.dart';
import '../../../domain/usecase/scedule/scedule_usecase.dart';
class   RoomSceduleEvent extends LogicHandler<RoomSceduleUseCase, String>{
  BookMatUseCase boockMatUseCase;
  RoomSceduleEvent(super.usecase,this.boockMatUseCase);

  @override
  call({required String data}) {
    // TODO: implement call
     return  RoomSceduleMutation(usecase, data);
  }

   bookMat(BuildContext context, {required String room, required String classId}) {
    return BookMatMutation(context,boockMatUseCase,{
      "calss_id": classId,
      "index" : room,
      "cus_id" : sl<Configration>().custId
    });
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
class BookMatMutation extends EventMutations<Map<String,dynamic>>  {
  BookMatUseCase usecase;

  String? err;

  BuildContext context;
  BookMatMutation(this.context,this.usecase, Map<String,dynamic> data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);
    if(!request.isLeft()){
      if (kDebugMode) {
        print("Sucsess");
      }
      successToast("Booked Success");
      request.forEach((r) => navigate.pushReplace(context, name: Routename.home,parms: {
        'page':BotemNavigations.scedule.name
      }));
      return;
    }else{
      errorToast("Already Booked");
    }
  }
}