
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../injection_container.dart';
import '../../../../../rought_genrator.dart';
import '../../../../data/models/api/scdule/room_scedule.dart';
import '../../../../data/models/api/scdule/scedule_api.dart';
import '../../../../domain/entities/vx_store.dart';
import '../../../modules/room_scedule/room_scedule_controller.dart';
import '../../screens/home/home_controller.dart';

class ClassBookingInfoDailog extends StatelessWidget {
  final String? selectedRoom;
  final RoomDetails? roomDetail;
  final Scedule? classData;
  final String? classId;
   ClassBookingInfoDailog({
    this.selectedRoom,
    super.key,
     required this.classId,
  }):roomDetail = stored.rooms?.roomDetails?.where((element) => element.sno.toString() == selectedRoom).firstOrNull(),
         classData = stored.scedules.where((element) => element.id.toString() == classId).firstOrNull();


  @override
  Widget build(BuildContext context) {
    final c = stored.scedules.where((element) => element.room_id == selectedRoom).firstOrNull();
    return AlertDialog(
        content:  Column(
          mainAxisAlignment:MainAxisAlignment.start,
          mainAxisSize:MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Confirm Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            // "${stored.rooms?.roomDetails?.where((element) => element.sno.toString() == selectedRoom).firstOrNull().floorNo}".text.make()
            buildBookinInfoDetails(title: 'Room',detail: roomDetail?.floorNo),
            buildBookinInfoDetails(title: 'Class',detail: classData?.title),
            buildBookinInfoDetails(title: 'Start Time',detail: classData?.appointments?.first.startTime),
            buildBookinInfoDetails(title: 'End Time',detail: classData?.appointments?.first.endTime),
            buildBookinInfoDetails(title: 'Start Date',detail: classData?.date?.first.startDate),
            buildBookinInfoDetails(title: 'End Date',detail: classData?.date?.first.endDate),
            buildBookinInfoDetails(title: 'Trainer Name',detail: classData?.date?.first.endDate),
          ],),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child:  VxConsumer(
                mutations: const {BookMatMutation},
                notifications: {
                  BookMatMutation: (ctx, store, {status}) {
                    // print("mystaus: ${status}");
                    if (status == VxStatus.error) {
                      // VxToast.show(
                      //     ctx, msg: (store as BookMatMutation).err ?? '');
                    } else if (status == VxStatus.success) {
                      navigate.push(context, name: Routename.home,parms:{
                        'page':BottemNavigationsData.dashboard.name,
                      });
                    }
                  }
                },
                builder: (context,store,status) {
                  if(status == VxStatus.loading){

                  }
                  return MaterialButton(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    onPressed: () => sl<RoomSceduleEvent>().bookMat(context,room:selectedRoom??"",classId:stored.scedules.where((element) => element.room_id == selectedRoom).firstOrNull().id.toString()),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (status == VxStatus.loading)?const CircularProgressIndicator():
                        Text(
                          'OK',
                          style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                }
            ),
          )
        ]);
  }

  Row buildBookinInfoDetails({required String title,String? detail,}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$title:"),
              Text(detail??''),
            ],
          );
  }
}