

import 'package:cloud_me_v2/tdd/data/models/api/invoice/purchase_invoce_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/scdule/scedule_api.dart';
import 'package:cloud_me_v2/tdd/data/models/api/trainers/trainers_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/user/dashboard_data.dart';
import 'package:cloud_me_v2/tdd/data/models/api/user/plans_data.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_consumer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/models/api/user/user_data.dart';


class ProjectStore extends VxStore{
 late ProductData data;
  String? user_type ;

  List<PlanDatas> plans = [];
  Map<String,dynamic>? pathParameters;
 DashBoardData? dashboard;
  List<Scedule> scedules = [];
 List<PersonalTrainerData>? trainerData;
  PurchaseInvoiceData? purchaseInvoiceData ;
 late Customer userdata;

}
enum UpdatedFrom{
 map,search,current
}
ProjectStore get stored => (VxState.store as ProjectStore);