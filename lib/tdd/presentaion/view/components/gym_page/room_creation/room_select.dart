import 'package:cached_network_image/cached_network_image.dart';
import 'package:rising_gym/core/util/calculations/calculation.dart';
import 'package:rising_gym/tdd/presentaion/modules/database_module/db_config_controller.dart';
import 'package:rising_gym/tdd/presentaion/modules/room_scedule/room_scedule_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../core/util/config/user_config.dart';
import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../injection_container.dart';
import '../../../../modules/room_scedule/room_scedule_consumer.dart';
import '../../../widgets/dailog/confirm_class_allert_dailog.dart';

class RoomSelect extends StatefulWidget {
  final String? roomId;
  final String? classId;
  final String? date;

  final bool  viewOnly;

  const RoomSelect({Key? key, this. roomId, this. classId,  this.viewOnly = false, this.date}) : super(key: key);

  @override
  State<RoomSelect> createState() => _RoomSelectState();
}

class _RoomSelectState extends State<RoomSelect> {
  final ValueNotifier<String> selectedRoom = ValueNotifier('9');
  @override
  void initState() {
    // TODO: implement initState
    if (kDebugMode) {
      print("Date :${widget.date}");
    }
    sl<RoomSceduleEvent>()(data: {'room_id':widget.roomId ?? '','date':widget.date});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Scaffold(
        appBar: AppBar(backgroundColor: FlutterFlowTheme.of(context).primary,),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: RoomSceduleContainer(
            builder: (context,store,status) {
              final roomData = store.rooms;
             final size = MediaQuery.of(context).size;
              return (roomData?.roomDetails!=null&&roomData!.roomDetails!.isNotEmpty)?Column(
                children: [
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children:[
                            ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              width: double.infinity,
                              height: double.infinity,
                              imageUrl:roomData.roomDetails?.firstOrNull()!=null?'https://cloudmedubai2020diag.blob.core.windows.net/cloudmeimages2020/storage${roomData.roomDetails?.firstOrNull().layout}':'',
                              fit: BoxFit.fill,
                            ),
                          ),
                            ...roomData.roomSpotDetails?.map((e) {
                              if(e.matStatus == 'booking' && e.bookingCusId == sl<Configration>().custId ){
                                selectedRoom.value = e.index.toString();
                              }
                              return Positioned(
                              top: (e.top.parseDouble??0)*.39,
                              left: (e.left.parseDouble??0)*.54,
                              child: GestureDetector(
                                onTap: () {
                                  if(e.matStatus == 'booking'||(widget.viewOnly))return;
                                  selectedRoom.value = e.index ?? "0";
                                  selectedRoom.notifyListeners();
                                },
                                child:ValueListenableBuilder<String>(
                                    valueListenable: selectedRoom,
                                    builder: (context,data,status) {
                                    return Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color:(data==e.index)?Colors.green:(e.matStatus == 'booking')?(widget.viewOnly)?Colors.transparent:Colors.grey: (widget.viewOnly)?Colors.transparent:FlutterFlowTheme.of(context).secondaryBackground,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                                        child: Text('${e.index}',style: FlutterFlowTheme.of(context).bodyMedium,
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ),
                            );
                            })??[] ,
                           if(widget.viewOnly!=true)
                            Positioned(
                              bottom: 1,
                              right: 1,
                              child: Builder(
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      // selectedRoom.value = e.index??"0";
                                      // selectedRoom.notifyListeners();
                                      showDialog(context: context, builder:(context) => ClassBookingInfoDailog(selectedMat: selectedRoom.value,selectedRoom:widget.roomId,classId:widget.classId,date:widget.date));
                                      // sl<RoomSceduleEvent>().bookMat(context,room:selectedRoom.value,classId:store.scedules.where((element) => element.room_id == widget.roomId).firstOrNull().id.toString());
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
                                  );
                                }
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
                  ),
                ],
              ):const Center(child: Text("No Room Addded"),);
            },
          ),
        ),
      ),
    );
  }
}
