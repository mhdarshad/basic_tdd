import 'package:cloud_me_v2/tdd/domain/usecase/product/product_usecase.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';

class ProductEvent extends LogicHandler<ProductUseCase, NoPrams> {
  ProductUseCase usecase;
  ProductEvent(this.usecase) : super(usecase);
  @override
  call({required NoPrams data}) => ProductMutation(usecase, data);
}

class ProductMutation extends EventMutations<NoPrams> {
  ProductUseCase usecase;
  ProductMutation(this.usecase, NoPrams data) : super(data);
  @override
  perform() async {
    final request = await usecase(data: data);
  }
}