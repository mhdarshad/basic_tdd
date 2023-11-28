import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/entities/api/user/plans_data.dart';
import '../../repositories/repository_provider.dart';

class PlansUseCase extends UseCase<List<PlanDatas>,NoPrams>{
  DependencyRepostProvider<dynamic> repo;
  PlansUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, List<PlanDatas>>> call({required NoPrams data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("all_plan"), methed: Methed.Get));
    return result.fold((l) => Left(l), (r) {
      return  Right((r as List).map((e) => PlanDatas.fromJson(e)).toList());
    });
  }
}