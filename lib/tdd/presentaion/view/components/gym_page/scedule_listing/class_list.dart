import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/data/models/api/scdule/scedule_api.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/entities/plans/subscribed_plans_listing.dart';
import '../../../../../domain/entities/vx_store.dart';
import '../../../../modules/scedule/scedule_consumer.dart';
import '../../../../modules/scedule/scedule_controller.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  DateTime get getCurrentTimestamp => DateTime.now();
@override
  void initState() {
    // TODO: implement initState
  sl<SceduleEvent>()(data: NoPrams());
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SceduleContainer(
        builder: (context,store,mutation) {
          final scedule = store.scedules;
        return ListView(
          children: scedule.map((e) => Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(
              //       16.0, 12.0, 0.0, 0.0),
              //   child: Text(
              //     '${e.title}',
              //     style: FlutterFlowTheme.of(context)
              //         .titleMedium
              //         .override(
              //       fontFamily: 'Readex Pro',
              //       color:
              //       FlutterFlowTheme.of(context)
              //           .secondaryText,
              //     ),
              //   ),
              // ),
              Classlist(e),
            ],
          )).toList(),
        );
      }
    );
  }
}

class Classlist extends StatelessWidget {
  final Scedule? classes;

  const Classlist(this. classes, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate.push(context, name: Routename.scedule,parms:  stored.pathParameters??{});
        // context.pushNamed('sceduleUserDetail');
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width *
              1.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context)
                .secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x411D2429),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius:
            BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding:
            const EdgeInsetsDirectional.fromSTEB(
                8.0, 8.0, 8.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(
                        8.0),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                      width: 70.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional
                        .fromSTEB(8.0, 0.0,
                        4.0, 0.0),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.max,
                      mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Text(
                          '${classes?.title}',
                          style: FlutterFlowTheme
                              .of(context)
                              .titleLarge,
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional
                              .fromSTEB(
                              0.0,
                              4.0,
                              8.0,
                              0.0),
                          child: AutoSizeText(
                            'Time: 6:00 AM to 9 :00 AM',
                            textAlign:
                            TextAlign.start,
                            style: FlutterFlowTheme
                                .of(context)
                                .bodySmall
                                .override(
                              fontFamily:
                              'Readex Pro',
                              fontSize:
                              12.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional
                              .fromSTEB(
                              0.0,
                              4.0,
                              8.0,
                              0.0),
                          child: AutoSizeText(
                            'Total Joinee : 205',
                            textAlign:
                            TextAlign.start,
                            style: FlutterFlowTheme
                                .of(context)
                                .bodySmall
                                .override(
                              fontFamily:
                              'Readex Pro',
                              fontSize:
                              12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize:
                  MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsetsDirectional
                          .fromSTEB(
                          0.0,
                          4.0,
                          0.0,
                          0.0),
                      child: Icon(
                        Icons
                            .chevron_right_rounded,
                        color:
                        FlutterFlowTheme.of(
                            context)
                            .secondaryText,
                        size: 24.0,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional
                          .fromSTEB(
                          0.0,
                          0.0,
                          4.0,
                          8.0),
                      child: Text(
                        '2m left',
                        textAlign:
                        TextAlign.end,
                        style:
                        FlutterFlowTheme.of(
                            context)
                            .bodySmall,
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
