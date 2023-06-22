import 'package:flutter/material.dart';

import '../../../domain/entities/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'trainer_controller.dart';

class TrainerContainer extends StatelessWidget {
  const TrainerContainer({super.key, required this.builder});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {TrainerMutation: (ctx, store, {status}) {
          if (status == VxStatus.error) {
            // VxToast.show(
            //     ctx, msg: (store as PlansListMutation).err ?? '');
          } else if (status == VxStatus.success) {

          }
        }
        }, mutations: const {TrainerMutation},
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