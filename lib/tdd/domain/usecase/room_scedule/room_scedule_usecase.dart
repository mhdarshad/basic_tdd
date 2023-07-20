import 'package:cloud_me_v2/core/error/failuers.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_consumer.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/scdule/room_scedule.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../repositories/repository_provider.dart';

class RoomSceduleUseCase extends UseCase<RoomSceduels,Map<String,dynamic>>{
  DependencyRepostProvider<dynamic> repo;
  RoomSceduleUseCase({required this.repo});

  @override
  Future<Either<Failure, RoomSceduels>> call({required Map<String,dynamic> data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("room_slot_details"), methed: Methed.Post,data: data));
    return result.fold((l) => Left(l), (r) => Right(RoomSceduels.fromJson(r)));
  }
}
class BookMatUseCase extends UseCase<bool,Map<String,dynamic>>{
  DependencyRepostProvider<dynamic> repo;
  BookMatUseCase({required this.repo});

  @override
  Future<Either<Failure, bool>> call({required Map<String,dynamic> data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("change_customer_mat_book"), methed: Methed.Post,data: data));
    return result.fold((l) => Left(l), (r) => const Right(true));
  }
}
class ClassMatUseCase extends UseCase<bool,Map<String,dynamic>>{
  DependencyRepostProvider<dynamic> repo;
  ClassMatUseCase({required this.repo});

  @override
  Future<Either<Failure, bool>> call({required Map<String,dynamic> data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("mat_details_for_schedule"), methed: Methed.Post,data: data));
    return result.fold((l) => Left(l), (r) => const Right(true));
  }
}