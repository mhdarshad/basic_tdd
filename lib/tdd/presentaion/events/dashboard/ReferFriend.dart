import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/usecase/refer_friend_usecase.dart';

class ReferfriendBloc
    extends LogicHandler<ReferfriendUseCase, String> {
  ReferfriendUseCase usecase;

  ReferfriendBloc(this.usecase) : super(usecase);

  @override
  call({ String? data}) {
    // TODO: implement call
    return ReferfriendEvents(usecase, data);
  }

}

class ReferfriendEvents extends EventMutations<String> {
  ReferfriendUseCase usecase;
late String link;
  ReferfriendEvents(this.usecase, String? data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data);
    request.fold((l) {
      if (kDebugMode) {
        print('link error:${l.props}');
      }
      link = '/';
      return l;
    }, (r) {
      if (kDebugMode) {
        print('link genrated:${r}');
      }
      link = r.toString();
       store?.referlink = r;
    });
  }
}