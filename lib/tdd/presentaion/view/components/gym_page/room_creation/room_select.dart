import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_me_v2/core/util/calculations/calculation.dart';
import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/room_scedule/room_scedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../injection_container.dart';
import '../../../../modules/room_scedule/room_scedule_consumer.dart';
import '../../../../modules/scedule/scedule_controller.dart';

class RoomSelect extends StatefulWidget {
  final String? roomId;

  const RoomSelect({Key? key, this. roomId}) : super(key: key);

  @override
  State<RoomSelect> createState() => _RoomSelectState();
}

class _RoomSelectState extends State<RoomSelect> {
  final ValueNotifier<String> selectedRoom = ValueNotifier('7');
  @override
  void initState() {
    // TODO: implement initState
    sl<RoomSceduleEvent>()(data: widget.roomId??'');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: RoomSceduleContainer(
            builder: (context,store,status) {
              final roomData = store.rooms;
             final size = MediaQuery.of(context).size;
              return Column(
                children: [
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ValueListenableBuilder<String>(
                          valueListenable: selectedRoom,
                          builder: (context,data,status) {
                            return Stack(
                              children:[
                                ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: double.infinity,
                                  imageUrl:'https://cloudmedubai2020diag.blob.core.windows.net/cloudmeimages2020/storage${roomData?.roomDetails?.first.layout}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                                ...roomData?.roomSpotDetails?.map((e) => Positioned(
                                  top: (e.top.parseDouble??0)*.39,
                                  left: (e.left.parseDouble??0)*.54,
                                  child: GestureDetector(
                                    onTap: () {
                                      selectedRoom.value = e.index??"0";
                                    selectedRoom.notifyListeners();
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color:data==e.index?Colors.green: FlutterFlowTheme.of(context).secondaryBackground,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                                        child: Text('${e.index}',style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))??[] ,
                                Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      // selectedRoom.value = e.index??"0";
                                      // selectedRoom.notifyListeners();

                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color:FlutterFlowTheme.of(context).secondaryBackground,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                                        child: Text('Continue',style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            );
                          }
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
