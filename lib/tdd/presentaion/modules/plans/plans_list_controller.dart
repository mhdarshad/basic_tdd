import 'package:rising_gym/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/event/event_hanling.dart';
import '../../../../core/util/presentation/Events/logic_event_handler.dart';
import '../../../data/models/api/user/plans_data.dart';
import '../../../domain/usecase/auth/user_login.dart';
import '../../../domain/usecase/plans/plans_usecase.dart';
class   PlansListEvent extends LogicHandler<PlansUseCase, NoPrams>{
  PlansListEvent(super.usecase);

  @override
  call({required NoPrams data}) {
    // TODO: implement call
 return  PlansListMutation(usecase, data);
  }

}
class PlansListMutation extends EventMutations<NoPrams>  {
  PlansUseCase usecase;
  PlansListMutation(this.usecase, NoPrams data) : super(data);

  @override
  perform() async {
    final request = await usecase(data:data);

    if(!request.isLeft()){
      if (kDebugMode) {
        print("logged in");
      }
      request.forEach((r) {
        store?.plans = r;
      });
    }
  }
}