import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:asspa/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/models/exception_modle.dart';
import '../../entities/user/kyc_update_model.dart';
import '../../entities/user/payment_transaction.dart';
import '../../repositories/repository_provider.dart';

class PaymentTransactionUseCase extends UseCase<PaymentTransactionModel,PaymentTransactionModle>{
  final DependencyRepostProvider<Map<String, dynamic>> repo;
  PaymentTransactionUseCase(this.repo);

  @override
  Future<Either<Failure, PaymentTransactionModel>> call({required PaymentTransactionModle data}) async{
    // TODO: implement call
    try {
      // throw UnimplementedError();
      final  request = await repo.getRequest(Params(uri: Uri.parse('transaction'),methed: Methed.Post,data: data.toJson()));
      return request.fold((l) => Left(l), (r) {
        print(r);
        return Right(PaymentTransactionModel.fromJson(r['data'][0]));
      });
    } on Failure catch (e) {
      print(e.toString());
      return Future.value(Left(ServerFailure(ExceptiomModle(message: 'Some thing Went Wrong'))));
    }
  }

  Future<Either<Failure, KycUpdateModel>> check() async{
    final  request = await repo.getRequest(Params(uri: Uri.parse('kyc/${sl<SharedPreferences>().getString(SFkeys.UID)}'),methed: Methed.Get,));
    return request.fold((l) => Left(l), (r) {
      print(r);
      return Right(KycUpdateModel.fromJson(r['data']));
    });
  }
}

class PaymentTransactionModle {
  String? tAmt;
  String? tType;
  String? sender;
  String? reciver;
  String? wallet;

  PaymentTransactionModle(
      {this.tAmt, this.tType, this.sender, this.reciver, this.wallet});

  PaymentTransactionModle.fromJson(Map<String, dynamic> json) {
    tAmt = json['t_amt'];
    tType = json['t_type'];
    sender = json['sender'];
    reciver = json['reciver'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t_amt'] = this.tAmt;
    data['t_type'] = this.tType;
    data['sender'] = this.sender;
    data['reciver'] = this.reciver;
    data['wallet'] = this.wallet;
    return data;
  }
}

