import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../domain/usecase/class_mat_booking/class_mat_booking.dart';

class MatDetailesSceduleEvent
    extends LogicHandler<MatDetailesSceduleUseCase, String> {
  MatDetailesSceduleEvent(super.usecase);

  @override
  call({required String data}) {
    // TODO: implement call
    return MatDetailesSceduleMutation(usecase, data);
  }
}

class MatDetailesSceduleMutation extends EventMutations<String> {
  MatDetailesSceduleUseCase usecase;

  String? err;

  MatDetailesSceduleMutation(this.usecase, String data)
      : super(data);

  @override
  perform() async {
    final request = await usecase(data: data);
    if (!request.isLeft()) {
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        store?.roomDateList = r;
      });
    }
  }
}