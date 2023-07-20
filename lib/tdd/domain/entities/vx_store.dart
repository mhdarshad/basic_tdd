

import 'package:cloud_me_v2/tdd/data/models/api/invoice/purchase_invoce_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/pland/plans_trainer_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/scdule/room_scedule.dart';
import 'package:cloud_me_v2/tdd/data/models/api/scdule/scedule_api.dart';
import 'package:cloud_me_v2/tdd/data/models/api/trainers/trainers_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/user/dashboard_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/user/plans_data.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_consumer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/models/api/scdule/mat_data_scedule.dart';
import '../../data/models/api/user/dash_board_date.dart';
import '../../data/models/api/user/user_data.dart';
import 'plans/subscribed_plans_listing.dart';


class ProjectStore extends VxStore{
 late ProductData data;
  String? user_type ;

  List<PlanDatas> plans = [];
 Plans? selectedPlans;
  Map<String,dynamic>? pathParameters;
 DashBoardData? dashboard;
 List<Scedule> scedules = [];
 List<PersonalTrainerData>? trainerData =[];
 PersonalTrainerData? selectedtrainer;
  PurchaseInvoiceData? purchaseInvoiceData ;
  Customer? userdata;

  RoomSceduels? rooms;

  PlansAndTrainerData? plandata;

 List<SubscribedPlans>? plan_forfilter = [];

  List<PersonalTrainerData> trainerForFIlter = [];

 List<SceduleMat> roomDateList = [];


}
enum UpdatedFrom{
 map,search,current
}
ProjectStore get stored => (VxState.store as ProjectStore);