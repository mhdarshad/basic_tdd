import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class CListView extends StatelessWidget {
  final String title;
  final String? discription;
  final List<Widget>? options;
  const CListView({
    Key? key,
    required this.title,
    this.discription,
    this.options
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x2F1D2429),
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.person_rounded,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      12, 0, 8, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                          fontFamily: 'Lexend Deca',
                          color: const Color(0xFF262D34),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      if(discription!=null)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 4, 0, 0),
                          child: Text(
                            '$discription',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                              fontFamily: 'Lexend Deca',
                              color: const Color(0xFF57636C),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if(options!=null)
                ...options!
            ],
          ),
        ),
      ),
    );
  }
}