import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/components/gym_page/dash_boaard_conteainer/dash_board.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/screens/home/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_widgets.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/entities/vx_store.dart';
import '../../../../modules/genrateInvoice/genrate_Invoice_consumer.dart';
import '../../../../modules/genrateInvoice/genrate_Invoice_controller.dart';

class PaymentConfirmContainer extends StatefulWidget {
  final String status;

  const PaymentConfirmContainer( {Key? key,required this.status,}) : super(key: key);

  @override
  State<PaymentConfirmContainer> createState() => _PaymentConfirmContainerState();
}

class _PaymentConfirmContainerState extends State<PaymentConfirmContainer> {
  @override
  void initState() {
    // TODO: implement initState
    if(widget.status=="paid"){
      sl<GenrateInvoiceEvent>()(data: {});
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: GentrateInvoiceConteainer(
          builder: (context,store,status) {
            return const StatusWidget(status:PayStatus.success);
          }, errorBuilder: (BuildContext context, ProjectStore store, VxStatus state) {
          return const StatusWidget(status:PayStatus.failure);
        }, initialState: (BuildContext context, ProjectStore store, VxStatus state) {
         return widget.status!="unpaid"? Center(child: TextButton(onPressed: () {
            navigate.pop(context);
          },
            child: "Go back".text.make(),),):const StatusWidget(status:PayStatus.failure);;
        },
        ),
      ),
    );
  }
}

enum PayStatus{
  success,failure
}
class StatusWidget extends StatelessWidget {
  final PayStatus status;

  const StatusWidget({
    super.key, required this.status,
  });
  @override
  Widget build(BuildContext context) {
    final paymentData = stored.purchaseInvoiceData;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 30,
                borderWidth: 2,
                buttonSize: 44,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20,
                ),
                onPressed: () async {
                  // context.pop();
                  navigate.pop(context);
                },
              ),
            ],
          ),
        ),
        StatusIcon( status: status,),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: Text(
            (status==PayStatus.success)?'Payment Confirmed!':'Transaction Failed',
            style: FlutterFlowTheme.of(context).displaySmall.override(
              fontFamily: 'Outfit',
              color: status==PayStatus.success?FlutterFlowTheme.of(context).primary:FlutterFlowTheme.of(context).error,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: Text(
            '${paymentData?.tranCurrency??''}${paymentData?.cartAmount??00}',
            style: FlutterFlowTheme.of(context).displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
          child: Text(
            'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(32, 20, 32, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Icon(Icons.credit_card),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Text(
                            '${paymentData?.paymentInfo?.paymentMethod??'Unknown Card'} : ${paymentData?.paymentInfo?.paymentDescription??''}',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FFButtonWidget(
                  onPressed: () {
                    if (kDebugMode) {
                      print('Button pressed ...');
                      navigate.pushReplace(context, name: Routename.home,parms: {
                        'page':BottemNavigationsData.dashboard.name
                      });
                    }
                  },
                  text: 'Go Home',
                  options: FFButtonOptions(
                    width: 230,
                    height: 50,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge,
                    elevation: 0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StatusIcon extends StatelessWidget {
  final PayStatus status;

  const StatusIcon( {
    required this. status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        shape: BoxShape.circle,
        border: Border.all(
          color: status==PayStatus.success?FlutterFlowTheme.of(context).primary:FlutterFlowTheme.of(context).error,
          width: 2,
        ),
      ),
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
        child: Icon(
          status==PayStatus.success?Icons.check_rounded:Icons.block,
          color: status==PayStatus.success?FlutterFlowTheme.of(context).primary:FlutterFlowTheme.of(context).error,
          size: 60,
        ),
      ),
    );
  }
}
