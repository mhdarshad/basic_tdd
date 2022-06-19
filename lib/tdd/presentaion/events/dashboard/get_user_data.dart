import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';

import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/get_dash_data.dart';

class GetUserDataBloc
    extends LogicHandler<GetUserDataUsecase, Param> {
  GetUserDataUsecase usecase;

  GetUserDataBloc(this.usecase) : super(usecase);

  @override
  call({required Param data}) {
    // TODO: implement call
    return GetUserDataEvents(usecase, data);
  }

}

class GetUserDataEvents extends EventMutations<Param> {
  GetUserDataUsecase usecase;

  GetUserDataEvents(this.usecase, Param data) : super(data);

  @override
  perform() async {
    final request = await usecase(data: data!);
    final usercount_request = await usecase.getAnalytics();
    request.fold((l) => throw ServerFailure(ExceptiomModle(message: 'error getting Data')), (r) {
      store?.pagination =r.pagination!;
      return store?.usersData = r.data!;
    });
    usercount_request.fold((l) => throw ServerFailure(ExceptiomModle(message: 'error getting Data')), (r) => store?.usersAnalytics = r);
  }
}