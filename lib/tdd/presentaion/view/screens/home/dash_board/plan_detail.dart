import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/data/models/api/trainers/trainers_data.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_widgets.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/entities/vx_store.dart';
import '../../../../modules/plan_trainer_data/plan_trainer_detail_consumer.dart';
import '../../../../modules/plan_trainer_data/plan_trainer_detail_controller.dart';
import '../../../../modules/update_trainer/updateTrainer_consumer.dart';
import '../../../../modules/update_trainer/updateTrainer_controller.dart';
import '../../../components/gym_page/select_trainer_container/select_trainer.dart';

class PlanDetail extends StatefulWidget {
  final String? planId;

  const PlanDetail({Key? key, this. planId}) : super(key: key);

  @override
  State<PlanDetail> createState() => _PlanDetailState();
}

class _PlanDetailState extends State<PlanDetail> {
  @override
  void initState() {
    // TODO: implement initState
    sl<PlanTrainerDetailEvent>()(data: widget.planId??'');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        // key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              // context.pop();
              navigate.pop(context);
            },
          ),
          title: Text(
            'Plan Detail',
            style: FlutterFlowTheme.of(context).bodyLarge,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: PlanTrainerDetailContainer(
            builder: (context,store,status) {
              final planData = store.plandata?.plans?.first;
              final trainerData = store.plandata?.trainerDetails?.where((element) => element.parentItem.toString() == planData?.itemCode.toString()).firstOrNull;
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (trainerData!=null)?Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:trainerData.image??'',
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                  errorWidget: (contxt,url,data){
                                    return Image.asset('assets/icons/profile.jpeg');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trainerData.trName??'',
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                  child: Text(
                                    trainerData.trainerMail??'',
                                    style: FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                            showDialog(context: context, builder: (context){
                              return UpdatetrainerContainer(
                                builder: (context,store,status) {
                                  return TrainersListtCOntroller(planData?.itemCode.toString(),onSelecttrainer: (e)=> onSelectTrainer(e),selectedtrainerId:trainerData.addonItem);
                                }
                              );
                               // SelectTrainer(planId:(planData?.itemCode??'0').toString());
                            });
                          },
                          text: 'Change',
                          options: FFButtonOptions(
                            height: 40,
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                            ),
                            elevation: 3,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  )
                      :Center(
                    child: MaterialButton(onPressed: (){
                      showDialog(context: context, builder: (context){
                        return TrainersListtCOntroller(
                          planData?.itemCode.toString(),
                          onSelecttrainer: (e)=> onSelectTrainer(e),
                        );
                        // SelectTrainer(planId:(planData?.itemCode??'0').toString());
                      });
                    },elevation: 8,child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(Icons.add,color: FlutterFlowTheme.of(context).primaryColor,),
                        Text("Add Trainer",style: TextStyle(color: FlutterFlowTheme.of(context).primaryColor),)
                      ],
                    ),),
                  ),
                  SizedBox(
                    height: 240,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child:CachedNetworkImage(
                            imageUrl: '',
                            errorWidget: (context,__,___){
                              return Image.asset('assets/image/gymimage.jpg');
                            },
                            width: double.infinity,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1, 1),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 6,
                                  sigmaY: 2,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                  child: Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).accent4,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Icon(
                                      Icons.document_scanner_outlined,
                                      color: FlutterFlowTheme.of(context).primary,
                                      size: 44,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Text(
                      planData?.itemDescription??"",
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Text(
                      'Introduction',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Text(
                      '${planData?.secItemDescription}',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  // Expanded(
                  //   child: ListView(
                  //     padding: EdgeInsets.zero,
                  //     primary: false,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.vertical,
                  //     children: list.map((e) => Padding(
                  //       padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  //       child: Container(
                  //         width: MediaQuery.of(context).size.width,
                  //         height: 100,
                  //         decoration: BoxDecoration(
                  //           color: FlutterFlowTheme.of(context).secondaryBackground,
                  //           boxShadow: const [
                  //             BoxShadow(
                  //               blurRadius: 3,
                  //               color: Color(0x411D2429),
                  //               offset: Offset(0, 1),
                  //             )
                  //           ],
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  //           child: Row(
                  //             mainAxisSize: MainAxisSize.max,
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                  //                 child: ClipRRect(
                  //                   borderRadius: BorderRadius.circular(8),
                  //                   child: Image.network(
                  //                     'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                  //                     width: 70,
                  //                     height: 100,
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Expanded(
                  //                 child: Padding(
                  //                   padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
                  //                   child: Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         '${e.title}',
                  //                         style: FlutterFlowTheme.of(context).titleLarge,
                  //                       ),
                  //                       Padding(
                  //                         padding:
                  //                         const EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                  //                         child: AutoSizeText(
                  //                           'Time: ${e.appointments?.first.startTime} to ${e.appointments?.first.endTime}',
                  //                           textAlign: TextAlign.start,
                  //                           style: FlutterFlowTheme.of(context)
                  //                               .bodySmall
                  //                               .override(
                  //                             fontFamily: 'Readex Pro',
                  //                             fontSize: 12,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               Column(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 crossAxisAlignment: CrossAxisAlignment.end,
                  //                 children: [
                  //                   Padding(
                  //                     padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  //                     child: Icon(
                  //                       Icons.chevron_right_rounded,
                  //                       color: FlutterFlowTheme.of(context).secondaryText,
                  //                       size: 24,
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 8),
                  //                     child: Text(
                  //                       '2m left',
                  //                       textAlign: TextAlign.end,
                  //                       style: FlutterFlowTheme.of(context).bodySmall,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     )).toList(),
                  //   ),
                  // ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void onSelectTrainer(PersonalTrainerData e) {
    if(e.itprRetlPrice!=0){
      stored.selectedtrainer = e;
      sl<UpdatetrainerEvent>()(context:context,data:e);
    }else{
      sl<UpdatetrainerEvent>()(context:context,data: e);
    }
  }
}
