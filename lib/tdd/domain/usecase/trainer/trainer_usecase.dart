import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/models/api/trainers/trainers_data.dart';
import '../../../data/models/api/user/plans_data.dart';
import '../../../presentaion/modules/trainer/trainer_controller.dart';
import '../../repositories/repository_provider.dart';

class TrainersUseCase extends UseCase<List<PersonalTrainerData>,PlanFetchData>{
  DependencyRepostProvider<dynamic> repo;
  TrainersUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, List<PersonalTrainerData>>> call({required PlanFetchData data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("available_trainers_for_plan"), methed: Methed.Post,data: {
      "plan_id":data.planId
    }));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  Right((r as List).map((e) => PersonalTrainerData.fromJson(e)).toList());
    });
  }
}