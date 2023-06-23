import 'package:flutter/material.dart';

import '../../../domain/entities/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'genrate_Invoice_controller.dart';

class GentrateInvoiceConteainer extends StatelessWidget {
  const GentrateInvoiceConteainer({super.key, required this.builder});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {GentrateInvoiceMutation: (ctx, store, {status}) {
          if (status == VxStatus.error) {

          } else if (status == VxStatus.success) {

          }
        }},
        mutations: const {GentrateInvoiceMutation},
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