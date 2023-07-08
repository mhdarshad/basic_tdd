import 'package:cloud_me_v2/core/error/failuers.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_consumer.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../repositories/repository_provider.dart';

class SceduleUseCase extends UseCase<List<Scedule>,NoPrams>{
  DependencyRepostProvider<dynamic> repo;
  SceduleUseCase({required this.repo});

  @override
  Future<Either<Failure, List<Scedule>>> call({required NoPrams data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("customer_schedule_list"), methed: Methed.Post,
    data: {
      "cus_id":sl<Configration>().custId
    }));
    return result.fold((l) => Left(l), (r) {
      return  Right((r as List).map((e) => Scedule.fromJson(e)).toList());
    });
  }

}