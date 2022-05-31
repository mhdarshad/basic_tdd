import '../../../tdd/domain/entities/user/login_user.dart';

class CountCalculation{
  bool isnumerical(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
  String? total(Wallet wallet){
    return  (double.parse(wallet.ref??'0')+double.parse(wallet.afw ??'0')+double.parse(wallet.iw??'0')+double.parse(wallet.genw??'0')).toString();

  }

}