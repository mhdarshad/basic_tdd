import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/kyc/kyc_update_usecase.dart';

class FetchKycsBloc extends LogicHandler<KycUpdateUseCase, NoPrams> {
  KycUpdateUseCase usecase;

  FetchKycsBloc(this.usecase) : super(usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return FetchKycsEvents(usecase, data);
  }

}

class FetchKycsEvents extends EventMutations<NoPrams> {
  KycUpdateUseCase usecase;

  FetchKycsEvents(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase.fetchkyc();
    request.fold((l) => throw ServerFailure(ExceptiomModle()), (r) => store?.users_kyc = r);
  }
}