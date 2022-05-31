import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';

import '../../../domain/usecase/get_dash_data.dart';

class GetdashdataBloc
    extends LogicHandler<GetWalletdataUseCase, String> {
  GetWalletdataUseCase usecase;

  GetdashdataBloc(this.usecase) : super(usecase);

  @override
  call({required String data}) {
    // TODO: implement call
    return GetdashdataEvents(usecase, data);
  }

}

class GetdashdataEvents extends EventMutations<String> {
  GetWalletdataUseCase usecase;

  GetdashdataEvents(this.usecase, String data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data!);
    // request.fold((l) => throw ServerFailure(), (r) => result = r);
  }
}