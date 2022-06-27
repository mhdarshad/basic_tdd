import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:asspa/tdd/domain/usecase/update_membership_status.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/kyc/kyc_update_usecase.dart';
import 'fetch_kycs.dart';

class KycUpdateStatusBloc extends LogicHandler<KycUpdateUseCase, ActivateParam> {
  KycUpdateUseCase usecase;

  KycUpdateStatusBloc(this.usecase) : super(usecase);

  @override
  call({required ActivateParam data}) {
    // TODO: implement call
    return KycUpdateStatusEvents(usecase, data);
  }

}

class KycUpdateStatusEvents extends EventMutations<ActivateParam> {
  KycUpdateUseCase usecase;

  KycUpdateStatusEvents(this.usecase, ActivateParam data) : super(data);

  @override
  perform() async {
    final request = await usecase.updateStatus(data!);
    request.fold((l) {
      print(l);
      throw ServerFailure(ExceptiomModle(message:l.properties[0],errors: l.properties[1]));
    }, (r) =>  next(() => FetchKycsEvents(usecase,Param({'pageno':store?.pagination?.currentPage,'status':USTatus.all.name}))));
  }
}