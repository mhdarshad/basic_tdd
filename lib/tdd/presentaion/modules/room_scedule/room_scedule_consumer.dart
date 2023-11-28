import 'package:rising_gym/rought_genrator.dart';
import 'package:rising_gym/tdd/presentaion/view/screens/home/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../domain/modle/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'room_scedule_controller.dart';

class RoomSceduleContainer extends StatelessWidget {
  const RoomSceduleContainer({super.key, required this.builder});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {
          RoomSceduleMutation: (ctx, store, {status}) {
          if (status == VxStatus.error) {
            // VxToast.show(
            //     ctx, msg: (store as PlansListMutation).err ?? '');
          } else if (status == VxStatus.success) {

          }
        },
        }, mutations: const {RoomSceduleMutation},
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