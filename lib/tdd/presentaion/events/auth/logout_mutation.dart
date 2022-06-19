import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection_container.dart';
import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/phoneauth/login_usecase.dart';

class LogoutBloc extends LogicHandler<PhoneLoginUseCase, NoPrams> {
  PhoneLoginUseCase usecase;

  LogoutBloc(this.usecase) : super(usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return LogoutEvents(usecase, data);
  }
}

class LogoutEvents extends EventMutations<NoPrams> {
  PhoneLoginUseCase usecase;
  LogoutEvents(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase.logout();
    request.fold((l) {
      sl<SharedPreferences>().clear();
      throw ServerFailure(ExceptiomModle(message: "Something went Wrong"));
    }, (r) {
      sl<SharedPreferences>().clear();
    });
  }
}