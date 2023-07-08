import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/repository_provider.dart';

class GenrateInvoiceUseCase extends UseCase<bool,Map<String,dynamic>>{
  DependencyRepostProvider<dynamic> repo;
  GenrateInvoiceUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, bool>> call({required Map<String,dynamic> data}) async{
    final paymentdata = stored.purchaseInvoiceData;
    final result =  await repo.getRequest(Params(uri: Uri.parse("make_payment"), methed: Methed.Post,data: data
    ));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  Right(true);
    });
  }
}