
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x25090F13),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning,',
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                    Text(
                      'Summary of your weekly Workout',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                    Divider(
                      height: 24,
                      thickness: 2,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Workout Day',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Text(
                                '1',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Next Work out time',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '6:00 AM',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
            child: Text(
              'Todays Scedule',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x411D2429),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                              width: 70,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gym  1',
                                  style: FlutterFlowTheme.of(context).titleLarge,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                                  child: AutoSizeText(
                                    'Time: 6:00 AM to 9 :00 AM',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 8),
                              child: Text(
                                '2m left',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x411D2429),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1610874150308-a1e6f8c905d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG91ciUyMG92ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                              width: 70,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gym 2',
                                  style: FlutterFlowTheme.of(context).titleLarge,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                                  child: AutoSizeText(
                                    'Time: 4:00PM to 7:00 PM',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 8),
                              child: Text(
                                '9h 20m left',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
            child: Text(
              'Active Plan',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
            child: ListView(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1607109793514-3075a25f6040?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBvdXIlMjBvdmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                              width: double.infinity,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'BUILD - A BETTER VERSION OF YOU',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'days',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'from',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'to',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    '29',
                                    style:
                                    FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '1 July',
                                    style:
                                    FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '29 july',
                                    style:
                                    FlutterFlowTheme.of(context).titleLarge,
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
              ],
            ),
          ),
        ],
      ),
    ) ;
  }
}
