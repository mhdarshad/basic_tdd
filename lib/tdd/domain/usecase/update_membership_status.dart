import 'package:asspa/core/error/failuers.dart';

import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';
import '../entities/user/login_user.dart';
import '../repositories/repository_provider.dart';

class UpdateStatusUseCase  extends UseCase<UsersData,ActivateParam>{
  DependencyRepostProvider<Map<String, dynamic>> repo;
  UpdateStatusUseCase(this.repo);

  @override
  Future<Either<Failure, UsersData>> call({required ActivateParam data}) async {
    final  value = await repo.getRequest(Params(uri: Uri.parse("user/active/${data.uid}"),
        methed: Methed.Put,
        data: {'status': data.status?'1':'0'}));
    return  Future.value(value.fold((l) =>Left(l), (r) =>Right(UserData.fromJson(r).data!.first)));
  }
  Future<Either<Failure, UsersData>> updateWallet({required WalletParams data}) async{
    final  value = await repo.getRequest(Params(uri: Uri.parse("user/wallet/${data.uid}"),
        methed: Methed.Put,
        data: {'af': data.autofill_wallet,'gen': data.gendral_wallet,'iw': data.income_wallet,'ref': data.refrence_wallet,}));
    return  Future.value(value.fold((l) =>Left(l), (r) =>Right(UserData.fromJson(r).data!.first)));

  }
}
class ActivateParam{
  String uid;
  bool status;

  ActivateParam(this.uid, this.status);
}
class WalletParams{
  final String uid;
  final String gendral_wallet,autofill_wallet,income_wallet,refrence_wallet;
  WalletParams(this.uid,
      {required this.gendral_wallet,
      required this.autofill_wallet,
      required this.income_wallet,
      required this.refrence_wallet});
}