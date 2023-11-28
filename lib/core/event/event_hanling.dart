import 'package:velocity_x/velocity_x.dart';

import '../../tdd/domain/modle/vx_store.dart';
import '../../tdd/presentaion/modules/notifier/error/error_notifier_controller.dart';
import '../error/failuers.dart';

abstract class EventMutations<T> extends VxMutation<ProjectStore>{
  T data;
  EventMutations(this.data);
  // @override
  // Object? next(VxMutationBuilder mutationBuilder) {
  //   // TODO: implement next
  //   return result;
  // }
  void errorToast(String message) => next(()=>ErrorNotifierMutation(NotificationData(NotificationType.toast_error, "Error:", message)));
  void successToast(String message) => next(()=>ErrorNotifierMutation(NotificationData(NotificationType.toast_succses, "Success:", message)));
  void warningToast(String message) => next(()=>ErrorNotifierMutation(NotificationData(NotificationType.toast_warning, "Warning:", message)));
}