import 'package:flutter/material.dart';
import '../../../domain/entities/vx_store.dart';
import 'Attaidence_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class AttaidenceContainer extends StatelessWidget {
  const AttaidenceContainer({super.key, required this.builder});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {AttaidenceMutation: (ctx, store, {status}) {
          if (status == VxStatus.error) {
            // VxToast.show(ctx, msg: (store as AttaidenceMutation).err ?? '');
          } else if (status == VxStatus.success) {

          }
        }
        }, mutations: const {AttaidenceMutation},
        builder: (context, store, state) {
          switch (state!) {
            case VxStatus.none:
            // TODO: Handle this case.
              break;
            case VxStatus.loading:
            // TODO: Handle this case.
              break;
            case VxStatus.success:
            // TODO: Handle this case.
              break;
            case VxStatus.error:
            // TODO: Handle this case.
              break;
          }
          return builder(context, store, state);
        }

    );
  }
}