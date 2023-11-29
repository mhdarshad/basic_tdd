import 'package:rising_gym/core/util/presentation/constants/ic_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

class Configration{
  String? dbType;
  Map<String,dynamic>? dbData ;
  String? get deviceId => sf.getString(SFkeys.DEVICE_ID.toString());
  SharedPreferences sf;
  Configration(this.sf);
  String? get custTocken=>sf.getString(SFkeys.token.toString());//
  String?  get custId => sf.getString(SFkeys.UID);
  int? get cid =>sf.getInt(SFkeys.UID);
}