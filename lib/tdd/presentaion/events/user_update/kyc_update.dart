import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/kyc/kyc_update_usecase.dart';

class KycUpdateBloc extends LogicHandler<KycUpdateUseCase, KycUpdateModle> {
  KycUpdateUseCase usecase;

  KycUpdateBloc(this.usecase) : super(usecase);

  @override
  call({required KycUpdateModle data}) {
    // TODO: implement call
    return KycUpdateEvents(usecase, data);
  }

}

class KycUpdateEvents extends EventMutations<KycUpdateModle> {
  KycUpdateUseCase usecase;

  KycUpdateEvents(this.usecase, KycUpdateModle data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data!);
    request.fold((l) {
      print(l);

      throw ServerFailure(ExceptiomModle(message:l.properties[0],errors: l.properties[1]));
    }, (r) => store?.kyc_data = r);
  }
}