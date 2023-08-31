import 'package:cloud_me_v2/core/util/presentation/constants/ic_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

class Configration{
  String? dbType;
  Map<String,dynamic>? dbData ;
  String? tocken;
  String? get custTocken=>sl<SharedPreferences>().getString(SFkeys.token.toString());//
  String? custId;
  int? get cid =>sl<SharedPreferences>().getInt(SFkeys.ID);
}