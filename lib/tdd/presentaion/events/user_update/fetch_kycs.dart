import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/kyc/kyc_update_usecase.dart';

class FetchKycsBloc extends LogicHandler<KycUpdateUseCase, Param> {
  KycUpdateUseCase usecase;

  FetchKycsBloc(this.usecase) : super(usecase);

  @override
  call({required Param data}) {
    // TODO: implement call
    return FetchKycsEvents(usecase, data);
  }

}

class FetchKycsEvents extends EventMutations<Param> {
  KycUpdateUseCase usecase;

  FetchKycsEvents(this.usecase, Param data) : super(data);

  @override
  perform() async {
    final request = await usecase.fetchkyc(data);
    request.fold((l) => throw ServerFailure(ExceptiomModle()), (r) {
       store?.pagination = r.pagination!;
       store?.users_kyc = r.data!;
    });
  }
}