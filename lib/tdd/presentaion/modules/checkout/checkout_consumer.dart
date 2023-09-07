import 'package:rising_gym/rought_genrator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/vx_store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'checkout_controller.dart';
import 'transaction_sucsess_controller.dart';

class CheckOutConteainer extends StatelessWidget {
  const CheckOutConteainer({super.key, required this.builder});

  final Widget Function(BuildContext context, ProjectStore store, VxStatus state) builder;

  @override
  Widget build(BuildContext context) {
    return VxConsumer<ProjectStore>(
        notifications: {CheckOutMutation: (ctx, store, {status}) {
          if (kDebugMode) {
             print("State : ");
          }
          if (status == VxStatus.error) {
            navigate.push(context, name: Routename.paymentStatus,qparms: {"status":'unpaid'});
            navigate.pop(context);
          } else if (status == VxStatus.success) {
            if (kDebugMode) {
              print("State :");
            }
            final storeddata =stored.purchaseInvoiceData;
            if (kDebugMode) {
              print("Successfully Paid");
            }
            navigate.push(context, name: Routename.paymentStatus,qparms: {
              "status":storeddata?.isSuccess??false?"paid":"unpaid"
            });
          }else if (status == VxStatus.loading){
              // VxToast.showLoading(context);
          }
        }},
        mutations: const {CheckOutMutation},
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