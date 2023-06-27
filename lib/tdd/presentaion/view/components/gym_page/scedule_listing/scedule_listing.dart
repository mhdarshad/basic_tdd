import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:calender_view_snacho/calender_page/calender_view_modle/calender_view_modle.dart';
import 'package:calender_view_snacho/calender_page/controller/calender_controller.dart';
import 'package:calender_view_snacho/calender_page/desktop_web/calender_view_desk_top.dart';
import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/core/util/calculations/convert.dart';
import 'package:cloud_me_v2/core/util/presentation/template/custom_scafold.dart';
import 'package:cloud_me_v2/rought_genrator.dart';
import 'package:cloud_me_v2/tdd/domain/entities/vx_store.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/scedule/scedule_consumer.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/scedule/scedule_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../injection_container.dart';
import '../../../widgets/calender_view/calender_page/controller/calender_controller.dart';
import '../../../widgets/calender_view/calender_page/desktop_web/calender_view_desk_top.dart';
extension CalenderFormat on List<String>{
   List<WeekDays> get toFormatKey =>map((e) =>({
      'sun':  WeekDays.sunday,
      'mon':  WeekDays.monday,
      'tue':  WeekDays.tuesday,
      'wed':  WeekDays.wednesday,
      'thu':  WeekDays.thursday,
      'fri':  WeekDays.friday,
      'sat':  WeekDays.saturday,
   }[e]!)).toList();
}
class SceduleListing extends StatefulWidget {
  const SceduleListing({Key? key, String? planId}) : super(key: key);

  @override
  State<SceduleListing> createState() => _SceduleListingState();
}

class _SceduleListingState extends State<SceduleListing> {
  @override
  void initState() {
    // TODO: implement initState
    sl<SceduleEvent>()(data: NoPrams());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return  /*SfCalendar();*/ProjectScafold(child: // Generated code for this Column Widget...
    // Generated code for this Column Widget...
    SceduleContainer(
        builder: (context,store,mutation) {
          final scedule = store.scedules;
          // return Container();
          return StaffTimlineCalender(
             // eventViewBuilder: (context,data){
             //   final appointment = (data.appointments.first as Appointment);
             //   return GestureDetector(onTap:()=>print("isMoreAppointmentRegion ${appointment}"),child: Padding(
             //     padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
             //     child: Container(
             //       width: MediaQuery.of(context)
             //           .size
             //           .width *
             //           1.0,
             //       height: 100.0,
             //       decoration: BoxDecoration(
             //         color: FlutterFlowTheme.of(context)
             //             .secondaryBackground,
             //         boxShadow: const [
             //           BoxShadow(
             //             blurRadius: 3.0,
             //             color: Color(0x411D2429),
             //             offset: Offset(0.0, 1.0),
             //           )
             //         ],
             //         borderRadius:
             //         BorderRadius.circular(12.0),
             //       ),
             //       child: Padding(
             //         padding:
             //         const EdgeInsetsDirectional.fromSTEB(
             //             8.0, 8.0, 8.0, 8.0),
             //         child: Row(
             //           mainAxisSize: MainAxisSize.max,
             //           children: [
             //             Padding(
             //               padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
             //               child: ClipRRect(
             //                 borderRadius:
             //                 BorderRadius.circular(
             //                     8.0),
             //                 child: Image.network(
             //                   'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
             //                   width: 70.0,
             //                   height: 100.0,
             //                   fit: BoxFit.cover,
             //                 ),
             //               ),
             //             ),
             //             Expanded(
             //               child: Padding(
             //                 padding:
             //                 const EdgeInsetsDirectional
             //                     .fromSTEB(8.0, 0.0,
             //                     4.0, 0.0),
             //                 child: Column(
             //                   mainAxisSize:
             //                   MainAxisSize.max,
             //                   mainAxisAlignment:
             //                   MainAxisAlignment
             //                       .center,
             //                   crossAxisAlignment:
             //                   CrossAxisAlignment
             //                       .start,
             //                   children: [
             //                     Text(
             //                       '${appointment.subject}',
             //                       style: FlutterFlowTheme
             //                           .of(context)
             //                           .titleLarge,
             //                     ),
             //                     Padding(
             //                       padding:
             //                       const EdgeInsetsDirectional
             //                           .fromSTEB(
             //                           0.0,
             //                           4.0,
             //                           8.0,
             //                           0.0),
             //                       child: AutoSizeText(
             //                         'Time: 6:00 AM to 9 :00 AM',
             //                         textAlign:
             //                         TextAlign.start,
             //                         style: FlutterFlowTheme
             //                             .of(context)
             //                             .bodySmall
             //                             .override(
             //                           fontFamily:
             //                           'Readex Pro',
             //                           fontSize:
             //                           12.0,
             //                         ),
             //                       ),
             //                     ),
             //                     Padding(
             //                       padding:
             //                       const EdgeInsetsDirectional
             //                           .fromSTEB(
             //                           0.0,
             //                           4.0,
             //                           8.0,
             //                           0.0),
             //                       child: AutoSizeText(
             //                         'Total Joinee : 205',
             //                         textAlign:
             //                         TextAlign.start,
             //                         style: FlutterFlowTheme
             //                             .of(context)
             //                             .bodySmall
             //                             .override(
             //                           fontFamily:
             //                           'Readex Pro',
             //                           fontSize:
             //                           12.0,
             //                         ),
             //                       ),
             //                     ),
             //                   ],
             //                 ),
             //               ),
             //             ),
             //             Column(
             //               mainAxisSize:
             //               MainAxisSize.max,
             //               mainAxisAlignment:
             //               MainAxisAlignment
             //                   .spaceBetween,
             //               crossAxisAlignment:
             //               CrossAxisAlignment.end,
             //               children: [
             //                 Padding(
             //                   padding:
             //                   const EdgeInsetsDirectional
             //                       .fromSTEB(
             //                       0.0,
             //                       4.0,
             //                       0.0,
             //                       0.0),
             //                   child: Icon(
             //                     Icons
             //                         .chevron_right_rounded,
             //                     color:
             //                     FlutterFlowTheme.of(
             //                         context)
             //                         .secondaryText,
             //                     size: 24.0,
             //                   ),
             //                 ),
             //                 Padding(
             //                   padding:
             //                   const EdgeInsetsDirectional
             //                       .fromSTEB(
             //                       0.0,
             //                       0.0,
             //                       4.0,
             //                       8.0),
             //                   child: Text(
             //                     '2m left',
             //                     textAlign:
             //                     TextAlign.end,
             //                     style:
             //                     FlutterFlowTheme.of(
             //                         context)
             //                         .bodySmall,
             //                   ),
             //                 ),
             //               ],
             //             ),
             //           ],
             //         ),
             //       ),
             //     ),
             //   ));
             // },
              onTap: (event){
                if(event.appointments?.isEmpty??true){
                  /// SanchoCalenderController.instance.changeView(CalendarView.schedule);
                  /// SanchoCalenderController.removeAppointment( appointment);
                  StaffTimlineCalenderController.setAppointment((event.resource?.id??"").toString(), Appointment(resourceIds:[event.resource!.id.toString()],subject: event.resource!.id.toString(),startTime: event.date!, endTime: event.date!.add(const Duration(hours: 2))));
                }
                final params =(stored.pathParameters??{});
                if (kDebugMode) {
                  print("room id : ${event.appointments?.first.id}");
                }
                navigate.push(context, name: Routename.room,parms: params,qparms: {
                  'room_id':scedule.where((element) => element.id == event.appointments?.first.id).firstOrNull?.room_id.toString()
                });
                },
              usersData: scedule.map((e) {
                e.days?.removeWhere((key, value) => value==null);
                final startDate = DateFormat('yyyy-MM-dd').parse(e.date!.first.startDate!);
                final endDate = DateFormat('yyyy-MM-dd').parse(e.date!.first.endDate!);

                final starttime = DateFormat('HH:mm:ss').parse(e.appointments!.first.startTime!);
                final endtime = DateFormat('HH:mm:ss').parse(e.appointments!.first.endTime!).subtract(const Duration(minutes: 2));
                return Person(id: e.id.toString(), name: e.title??'', brake: [
              ], imageUrl: "imageUrl",
                  appointments: [
                    Appointment(
                        subject:e.title??'',
                        id: e.id,
                        recurrenceRule: SfCalendar.generateRRule(RecurrenceProperties(interval:1,
                          startDate: startDate,
                          weekDays:e.days!.keys.toList().toFormatKey,
                          endDate: endDate,
                        ),
                            DateTime(startDate.year,startDate.month,startDate.day,starttime.hour,starttime.minute,starttime.second),
                            DateTime(endDate.year,endDate.month,endDate.day,endtime.hour,endtime.minute,endtime.second) ),
                        startTime: DateTime(startDate.year,startDate.month,startDate.day,starttime.hour,starttime.minute,starttime.second),
                        endTime: DateTime(endDate.year,endDate.month,endDate.day,endtime.hour,endtime.minute,endtime.second)
                    )
                  ]);
              }).toList());
        //
        }
    )
    );
  }
}
