

import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_consumer.dart';
import 'package:velocity_x/velocity_x.dart';


class ProjectStore extends VxStore{
 late ProductData data;
  String? user_type ;
}
enum UpdatedFrom{
 map,search,current
}
