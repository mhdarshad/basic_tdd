import 'package:velocity_x/velocity_x.dart';

import '../../tdd/domain/entities/vx_store.dart';

abstract class EventMutations<T> extends VxMutation<ProjectStore>{
  T data;
  EventMutations(this.data);
  // @override
  // Object? next(VxMutationBuilder mutationBuilder) {
  //   // TODO: implement next
  //   return result;
  // }
}