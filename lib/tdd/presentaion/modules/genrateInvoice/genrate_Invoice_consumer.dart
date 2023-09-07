import 'package:rising_gym/rought_genrator.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'genrate_Invoice_controller.dart';

class GentrateInvoiceConteainer extends StatelessWidget {
  const GentrateInvoiceConteainer({super.key, required this.builder, required this.errorBuilder, required this.initialState});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;
  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) errorBuilder;
  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) initialState;

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
            return initialState(context,store,state);
            case VxStatus.loading:
            // TODO: Handle this case.
            return const Center(child: CircularProgressIndicator(),);
            case VxStatus.success:
            // TODO: Handle this case.
              return builder(context, store, state);
            case VxStatus.error:
              return errorBuilder(context, store, state);
          }

        }
    );
  }
}