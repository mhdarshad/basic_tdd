import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failuers.dart';
import '../../../../core/event/event_hanling.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/config/user_config.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../../injection_container.dart';
import '../../../data/models/api/scdule/scedule_api.dart';
import '../../../domain/repositories/repository_provider.dart';

class SceduleModuleEvent
    extends LogicHandler<SceduleModuleUseCase, SceduleModuleDatas> {
  static ValueListenable<String?> classList = ValueNotifier(null);
  SceduleModuleEvent(super.usecase);

  @override
  call({required SceduleModuleDatas data}) {
    // TODO: implement call
    return SceduleModuleMutation(usecase, data);
  }
}

class SceduleModuleMutation extends EventMutations<SceduleModuleDatas> {
  SceduleModuleUseCase usecase;
  String? err;
  SceduleModuleMutation(this.usecase, SceduleModuleDatas data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: NoPrams());
    if (!request.isLeft()) {
      request.forEach((r) {

      });
    }
  }
}

class SceduleModuleDatas {
}


class SceduleModuleUseCase extends UseCase<List<Scedule>,NoPrams>{
  DependencyRepostProvider<dynamic> repo;
  SceduleModuleUseCase({required this.repo});

  @override
  Future<Either<Failure, List<Scedule>>> call({required NoPrams data}) async{
    final result =  await repo.getRequest(Params(uri: Uri.parse("customer_schedule_list"), methed: Methed.Post,
        data: {
          "cus_id":sl<Configration>().custId
        }
    ));
    return result.fold((l) => Left(l), (r) {
      return  Right((r as List).map((e) => Scedule.fromJson(e)).toList());
    });
  }

}