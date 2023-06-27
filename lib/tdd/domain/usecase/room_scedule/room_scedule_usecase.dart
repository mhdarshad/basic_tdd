import 'package:cloud_me_v2/core/error/failuers.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/product/product_consumer.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/scdule/room_scedule.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../repositories/repository_provider.dart';

class RoomSceduleUseCase extends UseCase<RoomSceduels,String>{
  DependencyRepostProvider<dynamic> repo;
  RoomSceduleUseCase({required this.repo});

  @override
  Future<Either<Failure, RoomSceduels>> call({required String data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("room_slot_details/$data"), methed: Methed.Get,));
    return result.fold((l) => Left(l), (r) => Right(RoomSceduels.fromJson(r)));
  }
}