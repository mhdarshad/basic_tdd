import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/trainer/trainer_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../injection_container.dart';
import '../../../../../data/models/api/trainers/trainers_data.dart';
import '../../../../modules/trainer/trainer_consumer.dart';

  class SelectTrainer extends StatelessWidget {
    final String? planId;
    const SelectTrainer({Key? key, this.planId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TrainersListtCOntroller(planId,onSelecttrainer: (e){
      stored.selectedtrainer = e;
      navigate.push(context, name: Routename.checkout);
    },);
  }
}

class TrainersListtCOntroller extends StatefulWidget {
  final Function(PersonalTrainerData e) onSelecttrainer;
  final String? planId;
  final int? selectedtrainerId;

  const TrainersListtCOntroller(this.planId,{
    super.key,
    required this.onSelecttrainer, this. selectedtrainerId
  });

  @override
  State<TrainersListtCOntroller> createState() => _TrainersListtCOntrollerState();
}

class _TrainersListtCOntrollerState extends State<TrainersListtCOntroller> {
 @override
  void initState() {
    // TODO: implement initState
   sl<TrainerEvent>()(data:  PlanFetchData(planId:widget.planId));
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TrainerContainer(
      builder: (context,storage,state) {
        final trainer = storage.trainerData?.where((element) => element.addonItem!=(widget.selectedtrainerId));
        return GestureDetector(
          // onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
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
                  navigate.pop(context);
                },
              ),
              title: Text(
                'Select Trainers',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                        child: Text(
                          'Trainers Availible',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(4, 12, 16, 0),
                        child: Text(
                          '${trainer?.length??0}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: trainer?.map((e) => GestureDetector(
                          onTap: () =>widget.onSelecttrainer(e),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color: FlutterFlowTheme.of(context).alternate,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: CachedNetworkImage(
                                        imageUrl:'${e.image}',
                                        fit: BoxFit.cover,
                                        width: 60,
                                        height: 60,
                                        errorWidget: (contxt,url,data){
                                          return Image.asset('assets/icons/profile.jpeg');
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                12, 0, 0, 0),
                                            child: Text(
                                              e.itemDescription,
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyLarge,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                      12, 0, 0, 0),
                                                  child: Text(
                                                    e.itemDescriptionName,
                                                    style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                      4, 0, 0, 0),
                                                  child: Text(
                                                    e.email??'',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if(e.itprRetlPrice!=0)
                                    Container(
                                      width: 100,
                                      padding: const EdgeInsetsDirectional.fromSTEB( 0, 0, 0, 0),
                                      child: Text(
                                        "${e.itprRetlPrice.toString()} AED",
                                        style: FlutterFlowTheme.of(context) .bodyLarge,
                                      ),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4, 4, 4, 4),
                                        child: Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )).toList()??[],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
