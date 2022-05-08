
import 'package:velocity_x/velocity_x.dart';
import 'login_data.dart';
import 'wallet/wallet_log.dart';

class ProjectStore extends VxStore{
final loginData = LoginDatas();
List<WalletData> wallet_log = [];
late UpdatedFrom updatedFrom ;
}
enum UpdatedFrom{
 map,search,current
}
