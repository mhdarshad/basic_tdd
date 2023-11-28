import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/entities/api/scdule/mat_data_scedule.dart';
import '../../../data/entities/api/scdule/scedule_api.dart';
import '../../../data/entities/api/user/dash_board_date.dart';
import '../../../data/entities/api/user/dashboard_data.dart';
import '../../../data/entities/api/user/plans_data.dart';
import '../../repositories/repository_provider.dart';

class MatDetailesSceduleUseCase extends UseCase<List<SceduleMat>,String>{
  DependencyRepostProvider<dynamic> repo;
  MatDetailesSceduleUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, List<SceduleMat>>> call({required String data}) async {
    final result =  await repo.getRequest(Params(uri: Uri.parse("mat_details_for_schedule"), methed: Methed.Post,data: {
      "class_id":data
    }));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }

      return  Right((r as List).map((e) => SceduleMat.fromJson(e)).toList());
    });
  }
}