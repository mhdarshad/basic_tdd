import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/models/api/pland/plans_trainer_data.dart';
import '../../repositories/repository_provider.dart';

class PlanTrainerDetailUseCase extends UseCase<PlansAndTrainerData,String>{
  DependencyRepostProvider<dynamic> repo;
  PlanTrainerDetailUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, PlansAndTrainerData>> call({required String data}) async{
    // final paymentdata = stored.purchaseInvoiceData;
    final result =  await repo.getRequest(Params(uri: Uri.parse("full_details_cus/$data"), methed: Methed.Get,));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  Right(PlansAndTrainerData.fromJson(r));
    });
  }
}