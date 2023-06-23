import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../../data/models/api/user/dashboard_data.dart';
import '../../../data/models/api/user/plans_data.dart';
import '../../repositories/repository_provider.dart';

class DashBoardUseCase extends UseCase<DashBoardData,NoPrams>{
  DependencyRepostProvider<dynamic> repo;
  DashBoardUseCase({required this.repo});
  /// call meted for inserting product to db

  /// Use Case For Setup DB
  @override
  Future<Either<Failure, DashBoardData>> call({required NoPrams data}) async {
    final result =  await repo.getRequest(Params(uri: Uri.parse("customer_dashboard"), methed: Methed.Post,data: {
      "cus_id":"${sl<Configration>().custId}"
    }));
    return result.fold((l) => Left(l), (r) {
      if (kDebugMode) {
        print(r);
      }
      return  Right(DashBoardData.fromJson(r));
    });
  }
}