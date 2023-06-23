import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_widgets.dart';
import '../../../../../../injection_container.dart';
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
      sl<GenrateInvoiceEvent>()(data: NoPrams());
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
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2,
                    ),
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                    child: Icon(
                      Icons.check_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Text(
                    'Payment Confirmed!',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Text(
                    '\$425.24',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/masterCard@2x.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.fitWidth,
                            ),
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
                                    'Mastercard Ending in 4021',
                                    style: FlutterFlowTheme.of(context).bodyLarge,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                  child: Text(
                                    '\$425.24',
                                    style: FlutterFlowTheme.of(context).labelMedium,
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
        ),
      ),
    );
  }
}
