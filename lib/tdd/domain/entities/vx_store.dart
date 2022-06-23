
import 'package:asspa/tdd/domain/entities/analitics/user_analitics.dart';
import 'package:asspa/tdd/domain/entities/user/kyc_update_model.dart';
import 'package:asspa/tdd/domain/entities/user/login_user.dart';
import 'package:velocity_x/velocity_x.dart';
import 'login_data.dart';
import 'user/payment_transaction.dart';
import 'wallet/wallet_log.dart';

class ProjectStore extends VxStore{
 UsersData UserData = UsersData();
 List<UsersData> usersData = [];
 Pagination? pagination;
 Analytics usersAnalytics = Analytics();
 Uri referlink = Uri();
 List<WalletData> wallet_log = [];
 late UpdatedFrom updatedFrom ;
  KycUpdateModel kyc_data =KycUpdateModel();
  List<KycUpdateModel> users_kyc =[];
 PaymentTransactionModel payment_transaction =PaymentTransactionModel();
  String? user_type ;
}
enum UpdatedFrom{
 map,search,current
}
