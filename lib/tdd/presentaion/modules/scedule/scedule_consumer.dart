import 'package:flutter/material.dart';

import '../../../domain/entities/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../room_scedule/room_scedule_controller.dart';
import '../trainer/trainer_controller.dart';
import 'scedule_controller.dart';

class SceduleContainer extends StatelessWidget {
  const SceduleContainer({super.key, required this.builder, this.onSucsess});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;
  final Function(ProjectStore store)? onSucsess;
  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {SceduleListMutation: (ctx, store, {status}) {
          if (status == VxStatus.error) {
            // VxToast.show(
            //     ctx, msg: (store as PlansListMutation).err ?? '');
          } else if (status == VxStatus.success) {
            if(onSucsess!=null){
              onSucsess!(stored);
            }
          }
        }
        }, mutations: const {SceduleListMutation,TrainerMutation,RoomSceduleMutation},
        builder: (context, store, state) {
          switch (state!) {
            case VxStatus.none:
            // TODO: Handle this case.
              break;
            case VxStatus.loading:
            // TODO: Handle this case.
            return const Center(child: CircularProgressIndicator());
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