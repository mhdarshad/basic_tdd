import 'package:flutter/material.dart';

import '../../../domain/modle/vx_store.dart';
import '../plans/plans_list_controller.dart';
import 'plan_trainer_detail_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class PlanTrainerDetailContainer extends StatelessWidget {
  const PlanTrainerDetailContainer({super.key, required this.builder});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {PlanTrainerDetailMutation: (ctx, store, {status}) {
          if (status == VxStatus.error) {
            VxToast.show(
                ctx, msg: (store as PlanTrainerDetailMutation).err ?? '');
          } else if (status == VxStatus.success) {

          }
        }
        }, mutations: const {PlanTrainerDetailMutation,PlansListMutation},
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