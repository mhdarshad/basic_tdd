import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/usecases/usecase.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import 'package:asspa/core/util/presentation/constants/ic_constants.dart';
import 'package:asspa/injection_container.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../domain/usecase/get_dash_data.dart';
import '../../../domain/usecase/update_membership_status.dart';
import 'get_user_data.dart';

class UpdateStatusBloc
    extends LogicHandler<UpdateStatusUseCase, ActivateParam> {
  UpdateStatusUseCase usecase;
  UpdateStatusBloc(this.usecase) : super(usecase);
  @override
  call({required ActivateParam data}) {
    // TODO: implement call
    return UpdateStatusEvents(usecase, data);
  }
}


class UpdateStatusEvents extends EventMutations<ActivateParam> {
  UpdateStatusUseCase usecase;
  UpdateStatusEvents(this.usecase, ActivateParam data) : super(data);
  @override
  perform() async {
    final request = await usecase(data: data!);
    request.fold((l) => throw Error, (r) => store?.usersData.replaceFirstWhere((currentValue) => currentValue.user?.uid == r.user?.uid, r) );
    next(() => GetUserDataEvents(GetUserDataUsecase(sll()),Param({'pageno':store?.pagination?.currentPage,'u_status':USTatus.all.name})));
  }
}