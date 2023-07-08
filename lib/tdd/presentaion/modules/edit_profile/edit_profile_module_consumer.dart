import 'package:flutter/material.dart';

import '../../../domain/entities/vx_store.dart';
import 'edit_profile_module_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileModuleContainer extends StatelessWidget {
    const EditProfileModuleContainer({super.key, required this.builder});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {EditProfileModuleMutation: (ctx, store, {status}) {
          if (status == VxStatus.error) {
            VxToast.show(ctx, msg: (store as EditProfileModuleMutation).err ?? '');
          } else if (status == VxStatus.success) {

          }
        }
        }, mutations: const {EditProfileModuleMutation},
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