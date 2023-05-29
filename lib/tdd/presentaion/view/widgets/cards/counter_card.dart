import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';

class CountCard extends StatelessWidget {
  final Color? color;
  final String walletname;
  final String discription;
  final String balence;
  final String unit;

  const CountCard({
    Key? key,
    this.color,
    required this.walletname,
    required this.balence,
    required this.discription,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color:color,
        child: Container(
          height: 200,
          decoration: const BoxDecoration(),
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      walletname,
                      style: FlutterFlowTheme.of(context).title3
                          .override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFFEBEBEB),
                      ),
                    ),
                    Text(
                      discription,
                      style: FlutterFlowTheme.of(context).subtitle2
                          .override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFFEBEBEB),
                      ),
                    ),

                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '$unit ${balence}',
                      style: FlutterFlowTheme.of(context).title1
                          .override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFFEBEBEB),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Text(
                        'View More',
                        style: FlutterFlowTheme.of(context).bodyText1
                            .override(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: const Color(0xFFEBEBEB),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}