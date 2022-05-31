
import 'package:asspa/tdd/domain/entities/user/login_user.dart';
import 'package:velocity_x/velocity_x.dart';
import 'login_data.dart';
import 'wallet/wallet_log.dart';

class ProjectStore extends VxStore{
 UsersData UserData = UsersData();
 List<UsersData> usersData = [];
 Uri referlink = Uri();
 List<WalletData> wallet_log = [];
 late UpdatedFrom updatedFrom ;
}
enum UpdatedFrom{
 map,search,current
}
