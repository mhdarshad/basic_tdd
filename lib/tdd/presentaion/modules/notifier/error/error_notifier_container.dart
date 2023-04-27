import 'package:cloud_me_v2/core/helper/toast_builder/toast_controller.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'error_notifier_controller.dart';

class CustomNotifier extends StatelessWidget {
  const CustomNotifier({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VxNotifier(
      mutations: {
        ErrorNotifierMutation: (ctx, store, {status}) {
          switch((store as ErrorNotifierMutation).data.type ){

            case NotificationType.alertDialog:
              // TODO: Handle this case.
              break;
            case NotificationType.toast_succses:
              CToast.toast(ctx, msg: store.data.messege ?? '').success;
              break;
            case NotificationType.toast_warning:
              CToast.toast(ctx, msg: store.data.messege ?? '').warning;
              break;
            case NotificationType.toast_error:
              CToast.toast(ctx, msg: store.data.messege ?? '').error;
              // VxToast.show( ctx, msg: );
              break;
            case NotificationType.bottemSheet:
              // TODO: Handle this case.
              break;
          }
        }
      },
      child: child,
    );
  }
}