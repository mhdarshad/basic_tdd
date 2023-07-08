import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../data/models/api/trainers/trainers_data.dart';
import '../../repositories/repository_provider.dart';

class AttaidenceUseCase extends UseCase<List<PersonalTrainerData>, Map<String,dynamic>>{
  DependencyRepostProvider<dynamic> repo;
  AttaidenceUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, List<PersonalTrainerData>>> call({required Map<String,dynamic> data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("attendance_transfer"), methed: Methed.Post,data: data));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  Right((r as List).map((e) => PersonalTrainerData.fromJson(e)).toList());
    });
  }
}
// {
// "staff_id": "100038",
// "batch_id": "33",
// "start_date": "2023-06-15",
// "end_date": "2023-06-15",
// "start_time": "2023-06-15",
// "end_time": "2023-06-15"
// }