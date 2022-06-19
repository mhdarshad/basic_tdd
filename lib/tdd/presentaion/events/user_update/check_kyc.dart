import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:asspa/tdd/data/models/exception_modle.dart';

import '../../../domain/usecase/kyc/kyc_update_usecase.dart';

class CheckKycBloc extends LogicHandler<KycUpdateUseCase, NoPrams> {
  KycUpdateUseCase usecase;

  CheckKycBloc(this.usecase) : super(usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return CheckKycEvents(usecase, data);
  }

}

class CheckKycEvents extends EventMutations<NoPrams> {
  KycUpdateUseCase usecase;

  CheckKycEvents(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase.check();
    request.fold((l) => throw ServerFailure(ExceptiomModle()), (r) => store?.kyc_data = r);
  }
}