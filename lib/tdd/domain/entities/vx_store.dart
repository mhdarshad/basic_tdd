

import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_data.dart';
import 'package:velocity_x/velocity_x.dart';


class ProjectStore extends VxStore{
 late ProductData data;
  String? user_type ;
}
enum UpdatedFrom{
 map,search,current
}
