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
import 'package:velocity_x/velocity_x.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../../injection_container.dart';
import '../../../../../domain/entities/contry_data.dart';
import '../../../../modules/edit_profile/edit_profile_module_controller.dart';
import '../../../../modules/scedule_module/scedule_module_controller.dart';
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
   }[e]?? WeekDays.sunday)).toList();
   String get toFormatStringKey =>map((e) =>({
      'sun':  'SU',
      'mon': 'MO',
      'tue':  'TU',
      'wed': 'WE',
      'thu':  'TH',
      'fri':  'FR',
      'sat': 'SA'
   }[e]?? '')).toList().join(',');
   List<int> get toFormatintKey =>map((e) =>({
      'sun':  7,
      'mon': 1,
      'tue':  2,
      'wed': 3,
      'thu':  4,
      'fri':  5,
      'sat':6
   }[e]?? 1)).toList();
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
    sl<SceduleEvent>()(data: null);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  ProjectScafold(
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          actions:  [
          //TODO:: Add Filter
          Row(
            children: [
              const Text("Filter:"),
              DropDownContainer(hint:"Select Filter",data: SceduleEvent.filterData,builder: (context,data){
                return Text(data,style: const TextStyle(color: Colors.white),);
              },onSelect: (value){
                sl<SceduleEvent>().getFilterData(value);
              }),
            ],
          ),
          ValueListenableBuilder(
              valueListenable: SceduleEvent.filterFor,
              builder: (context,value,_) {
                return Row(
                children: [
                  if(value!=null)
                  DropDownContainer<Map<String,dynamic>?>(
                      hint:'Select ${value['title']??''}',
                      data: value['data'],
                      builder: (context,data){
                    return Text(data?['name']??'',style: const TextStyle(color: Colors.white),);
                  },
                      onSelect: (fvalue){
                        print("Selected Value${fvalue?['name']} and its Id: ${fvalue?['id']}");
                        sl<SceduleEvent>()(data: FilterData(value['key'], (fvalue?['id']).toString()));
                  }),
                ],
              );
            }
          ),
        ],),
        child:  SceduleContainer(
        builder: (context,store,mutation) {
          final scedule = store.scedules;
          // scedule.filter((sceduleData)=> sceduleData.planId.toString() == '');
          // return Container();
          if (kDebugMode) {
            print(scedule.length);
          }
          return StaffTimlineCalender(
              StaffTimlineCalenderController.instance,
             headerColor: FlutterFlowTheme.of(context).primary,
             eventViewBuilder: (context,data){
               final appointment = (data.appointments.first as Appointment);
                final trainerDetail =scedule.firstWhere((element) => appointment.id == element.id).trainername;

               print(scedule.firstWhere((element) => appointment.id == element.id).days?.keys.toList().toFormatintKey);
               scedule.firstWhere((element) => appointment.id.toString() == element.id.toString()).days?.removeWhere((key, value) => value==null);
               final isweekDay = scedule.map((element) => scedule.firstWhere((element) => appointment.id == element.id).days?.keys.toList().toFormatintKey.any((week) {
                print("$week ${data.date.weekday} ${appointment.subject}");
                 return data.date.weekday == week;
               })).first;

               return (isweekDay??false)?Container(
                 width: MediaQuery.of(context).size.width * 1.0,
                 height: 100.0,
                 decoration: BoxDecoration(
                   color: FlutterFlowTheme.of(context) .primary,
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
                 child: Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     // Padding(
                     //   padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
                     //   child: ClipRRect(
                     //     borderRadius:
                     //     BorderRadius.circular(
                     //         8.0),
                     //     child: Image.network(
                     //       'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                     //       width: 70.0,
                     //       height: 100.0,
                     //       fit: BoxFit.cover,
                     //     ),
                     //   ),
                     // ),
                     Expanded(
                       child: Padding(
                         padding:
                         const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                         child: Column(
                           mainAxisSize:
                           MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment  .center,
                           crossAxisAlignment: CrossAxisAlignment .start,
                           children: [
                             Text(
                               appointment.subject,
                               style: FlutterFlowTheme.of(context) .titleLarge.copyWith(color: Colors.white),
                             ),
                             Padding(
                               padding:
                               const EdgeInsetsDirectional.fromSTEB(0.0, 4.0,  8.0, 0.0),
                               child: AutoSizeText(
                                 'Time: ${DateFormat('hh:mm a').format(appointment.startTime)} to ${DateFormat('hh:mm a').format(appointment.endTime)}',
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
                                 ).copyWith(color: Colors.white),
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
                                 'Trainer : $trainerDetail',
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
                                 ).copyWith(color: Colors.white),
                               ),
                             ),
                             // Padding(
                             //   padding:
                             //   const EdgeInsetsDirectional
                             //       .fromSTEB(
                             //       0.0,
                             //       4.0,
                             //       8.0,
                             //       0.0),
                             //   child: AutoSizeText(
                             //     'Week : ${data.date.weekday}',
                             //     textAlign:
                             //     TextAlign.start,
                             //     style: FlutterFlowTheme
                             //         .of(context)
                             //         .bodySmall
                             //         .override(
                             //       fontFamily:
                             //       'Readex Pro',
                             //       fontSize:
                             //       12.0,
                             //     ).copyWith(color: Colors.white),
                             //   ),
                             // ),
                           ],
                         ),
                       ),
                     ),
                     const Column(
                       mainAxisSize:
                       MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment:CrossAxisAlignment.end,
                       children: [
                         Padding(
                           padding:
                           EdgeInsetsDirectional
                               .fromSTEB(
                               0.0,
                               4.0,
                               0.0,
                               0.0),
                           child: Icon(
                             Icons
                                 .chevron_right_rounded,
                             color:Colors.white,
                             size: 24.0,
                           ),
                         ),
                         // Padding(
                         //   padding:
                         //   const EdgeInsetsDirectional
                         //       .fromSTEB(
                         //       0.0,
                         //       0.0,
                         //       4.0,
                         //       8.0),
                         //   child: Text(
                         //     '2m left',
                         //     textAlign:
                         //     TextAlign.end,
                         //     style:
                         //     FlutterFlowTheme.of(
                         //         context)
                         //         .bodySmall,
                         //   ),
                         // ),
                       ],
                     ),
                   ],
                 ),
               ): Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("No Class Scheduled for\n ${appointment.subject}"),
               );
             },
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
                  'room_id':scedule.where((element) => element.id == event.appointments?.first.id).firstOrNull().room_id.toString(),
                  'class_id':scedule.where((element) => element.id == event.appointments?.first.id).firstOrNull().id.toString(),
                  'date':DateFormat('yyyy-MM-dd').format(event.date??DateTime.now())
                });
                },
              calView: CalendarView.schedule,
              usersData: scedule.map((e) {
                e.days?.removeWhere((key, value) => value==null);
                print(e.days!.keys.toSet().toList().toList().toFormatKey);
                print(e.title);
                print("e.days");
                final startDate = DateFormat('yyyy-MM-dd').parse(e.date!.first.startDate!);
                final endDate = DateFormat('yyyy-MM-dd').parse(e.date!.first.endDate!);
                final starttime = DateFormat('HH:mm:ss').parse(e.appointments!.first.startTime!);
                final endtime = DateFormat('HH:mm:ss').parse(e.appointments!.first.endTime!).subtract(const Duration(minutes: 2));
               print("Start Date Time ${DateTime(startDate.year,startDate.month,startDate.day,starttime.hour,starttime.minute,starttime.second)}");
               print("End Date Time ${DateTime(endDate.year,endDate.month,endDate.day,endtime.hour,endtime.minute,endtime.second) }");
               // print("Days Interval: FREQ=WEEKLY;INTERVAL=1;BYDAY=${e.days?.keys.toList().toFormatStringKey};COUNT=10");
                print(SfCalendar.generateRRule(RecurrenceProperties(
                  recurrenceType: RecurrenceType.weekly,
                  startDate: DateTime(startDate.year,startDate.month,startDate.day,starttime.hour,starttime.minute,starttime.second),
                  weekDays:e.days!.keys.toList().toFormatKey,
                  recurrenceRange: RecurrenceRange.endDate,
                  // recurrenceCount: endDate.difference(startDate).inDays+1,
                  endDate: DateTime(endDate.year,endDate.month,endDate.day,endtime.hour,endtime.minute,endtime.second),
                ),DateTime(startDate.year,startDate.month,startDate.day,starttime.hour,starttime.minute,starttime.second),
                    DateTime(endDate.year,endDate.month,endDate.day,endtime.hour,endtime.minute,endtime.second) ));
                return Person(id: e.id.toString(), name: e.title??'', brake: [
              ], imageUrl: "imageUrl",appointments: [
                    Appointment(
                        subject:e.title??'',
                        id: e.id,
                        // recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=${e.days?.keys.toList().toFormatStringKey};COUNT=10',
                        // recurrenceRule: e.days!.keys.toList().toFormatKey.isNotEmpty?SfCalendar.generateRRule(RecurrenceProperties(
                        //   recurrenceType: RecurrenceType.monthly,
                        //   startDate: DateTime(startDate.year,startDate.month,startDate.day,starttime.hour,starttime.minute,starttime.second),
                        //   weekDays:e.days!.keys.toList().toFormatKey,
                        //   recurrenceRange: RecurrenceRange.endDate,
                        //   endDate: DateTime(endDate.year,endDate.month,endDate.day,endtime.hour,endtime.minute,endtime.second),
                        // ),DateTime(startDate.year,startDate.month,startDate.day,starttime.hour,starttime.minute,starttime.second), DateTime(endDate.year,endDate.month,endDate.day,endtime.hour,endtime.minute,endtime.second) ):null,
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

  Widget DropDownContainer<T>(
      {
        required List<T> data ,
        String hint = "Select ",
      required Widget Function(BuildContext, T) builder,
      required Function(T?) onSelect}) {
    ValueNotifier<T?> dropDownAdapter = ValueNotifier(null);
    return data.isNotEmpty?Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
          child: ValueListenableBuilder<T?>(
              valueListenable: dropDownAdapter,
              builder: (context,store,_) {
                if (kDebugMode) {
                  print("store:$store");
                }
                return DropdownButton<T>(
                  hint:  Text(hint,style: const TextStyle(color: Colors.white),),
                    onChanged: (value) {
                      dropDownAdapter.value = value;
                      dropDownAdapter.notifyListeners();
                      onSelect(value);
                    },
                    value: store,
                    items: data.map((e) => DropdownMenuItem<T>(
                      value:e,
                      child: builder(context,e),
                )).toList());
              }
          ),
        ):const SizedBox.shrink();
  }
}
