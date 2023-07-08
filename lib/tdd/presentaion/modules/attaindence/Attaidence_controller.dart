

import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/attadence_transfer/attadence_usecase.dart';

class AttaidenceEvent extends LogicHandler<AttaidenceUseCase, Map<String,dynamic>> {
  AttaidenceEvent(super.usecase);

  @override
  call({required Map<String,dynamic> data}) {
    return AttaidenceMutation(usecase, data);
  }
}

class AttaidenceMutation extends EventMutations<Map<String,dynamic>> {
  AttaidenceUseCase usecase;
  AttaidenceMutation(this.usecase, Map<String,dynamic> data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data);
    if (!request.isLeft()) {
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {

      });
    }
  }
}