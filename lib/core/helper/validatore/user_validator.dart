import 'package:asspa/tdd/domain/entities/user/login_user.dart';

class UserValidator{
  // UsersData  usersData;
  User? user;
  Wallet? wallet;
  UserValidator(UsersData usersData):user= usersData.user, wallet = usersData.wallet;
  bool get genralvalletstatus{
    return ((wallet?.genwstatus??"0")!="0")&&isUserActive;
  }
  bool get incomevalletstatus{
    return ((wallet?.genwstatus??"0")!="0")&&isUserActive;
  }
  bool get autofillvalletstatus{
    return ((wallet?.genwstatus??"0")!="0")&&isUserActive;
  }
  bool get refrervalletstatus{
    return/* ((wallet?.refstatus??"0")!="0")&&*/isUserActive;
  }
  bool get isUserActive{
    return ((user?.accountstatus??'0')=='1');
  }
  bool get anyWalletStatus{
    return genralvalletstatus||incomevalletstatus||autofillvalletstatus;
  }
}