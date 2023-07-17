import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/models/api/trainers/trainers_data.dart';
import '../../repositories/repository_provider.dart';

class GetAllContriesUseCase extends UseCase<List<PersonalTrainerData>, Map<String,dynamic>>{
  DependencyRepostProvider<dynamic> repo;
  GetAllContriesUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, List<PersonalTrainerData>>> call({required Map<String,dynamic> data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("get_all_country"), methed: Methed.Get,));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  Right((r as List).map((e) => PersonalTrainerData.fromJson(e)).toList());
    });
  }
}