import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/presentation/constants/ic_constants.dart';
import '../../../../injection_container.dart';
import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/get_dash_data.dart';
import '../../../domain/usecase/update_membership_status.dart';
import 'get_user_data.dart';

class UpdateWalletBloc
    extends LogicHandler<UpdateStatusUseCase, WalletParams> {
  UpdateStatusUseCase usecase;

  UpdateWalletBloc(this.usecase) : super(usecase);

  @override
  call({required WalletParams data}) {
    // TODO: implement call
    return UpdateWalletEvents(usecase, data);
  }

}

class UpdateWalletEvents extends EventMutations<WalletParams> {
  UpdateStatusUseCase usecase;

  UpdateWalletEvents(this.usecase, WalletParams data) : super(data);

  @override
  perform() async {
    final request = await usecase.updateWallet(data: data!);
    request.fold((l) => throw ServerFailure(ExceptiomModle(message: "Server Exception")), (r) => store?.UserData = r);
    next(() => GetUserDataEvents(GetUserDataUsecase(sll()),Param({'pageno':store?.pagination?.currentPage,'u_status':USTatus.all.name})));
  }
}