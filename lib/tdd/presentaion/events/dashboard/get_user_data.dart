import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';

import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/get_dash_data.dart';

class GetUserDataBloc
    extends LogicHandler<GetUserDataUsecase, NoPrams> {
  GetUserDataUsecase usecase;

  GetUserDataBloc(this.usecase) : super(usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
    return GetUserDataEvents(usecase, data);
  }

}

class GetUserDataEvents extends EventMutations<NoPrams> {
  GetUserDataUsecase usecase;

  GetUserDataEvents(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data!);
    request.fold((l) => throw ServerFailure(ExceptiomModle(message: 'error getting Data')), (r) => store?.usersData = r);
  }
}