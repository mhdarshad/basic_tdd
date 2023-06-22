import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/dashboard/dashboard_usecase.dart';
import '../../../domain/usecase/scedule/scedule_usecase.dart';
class   SceduleEvent extends LogicHandler<SceduleUseCase, NoPrams>{
  SceduleEvent(super.usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
     return  SceduleMutation(usecase, data);
  }
}

class SceduleMutation extends EventMutations<NoPrams>  {
  SceduleUseCase usecase;
  SceduleMutation(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);

    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        store?.scedules = r;
      });
    }
  }
}