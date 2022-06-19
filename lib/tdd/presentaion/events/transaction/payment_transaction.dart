import 'package:asspa/core/event/event_hanling.dart';
import 'package:asspa/core/error/failuers.dart';
import 'package:asspa/core/util/presentation/Events/logic_event_handler.dart';

import '../../../data/models/exception_modle.dart';
import '../../../domain/usecase/transaction/payment_transation.dart';

class PaymentTransactionBloc
    extends LogicHandler<PaymentTransactionUseCase, PaymentTransactionModle> {
  PaymentTransactionUseCase usecase;

  PaymentTransactionBloc(this.usecase) : super(usecase);

  @override
  call({required PaymentTransactionModle data}) {
    // TODO: implement call
    return PaymentTransactionEvents(usecase, data);
  }

}

class PaymentTransactionEvents extends EventMutations<PaymentTransactionModle> {
  PaymentTransactionUseCase usecase;


  PaymentTransactionEvents(this.usecase, PaymentTransactionModle data)
      : super(data);

  @override
  perform() async {
    final request = await usecase(data: data!);
    request.fold((l) => throw ServerFailure(ExceptiomModle()), (r) => store?.payment_transaction = r);
  }
}
