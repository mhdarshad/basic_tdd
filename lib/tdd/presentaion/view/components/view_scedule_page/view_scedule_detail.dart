import 'package:calender_view_snacho/calender_page/calender_view_modle/calender_view_modle.dart';
import 'package:calender_view_snacho/calender_page/controller/calender_controller.dart';
import 'package:calender_view_snacho/calender_page/desktop_web/calender_view_desk_top.dart';
import 'package:cloud_me_v2/core/util/config/user_config.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/room_scedule/room_scedule_controller.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/components/gym_page/scedule_listing/scedule_listing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_util.dart';
import '../../../../../injection_container.dart';
import '../../../../domain/entities/vx_store.dart';
import '../../../modules/scedule/scedule_consumer.dart';
import '../../../modules/scedule/scedule_controller.dart';
import '../gym_page/room_creation/room_select.dart';

class ViewSceduleDetail extends StatefulWidget {
  final String? sceduleId;

  const ViewSceduleDetail({Key? key,this.sceduleId}) : super(key: key);

  @override
  State<ViewSceduleDetail> createState() => _ViewSceduleDetailState();
}

class _ViewSceduleDetailState extends State<ViewSceduleDetail> {
  @override
  void initState() {
    // TODO: implement initState
    sl<SceduleEvent>()(data: null);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(bottom:  const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.info)),
            Tab(icon: Icon(Icons.calendar_month)),
          ],
        ),),
        body: TabBarView(
          children: [
            SceduleInformation(),
            CalenderView(),
          ],
        ),
      ),
    );
  }

  Widget SceduleInformation() => SceduleContainer(
      onSucsess: (store){
        final scedule = stored.scedules.where((e)=>e.id.toString() == widget.sceduleId).toList();
        sl<RoomSceduleEvent>()(data: scedule.first.room_id??'');
      },
      builder: (context,store,mutation) {
        final scedule = store.scedules.where((e)=>e.id.toString() == widget.sceduleId).toList();
        final plan = stored.dashboard?.subscribedPlans?.where((element) => element.itemCode == scedule.first.planId).toList();
        final trainerData = store.plandata?.trainerDetails?.where((element) => element.parentItem.toString() == plan?.first.itemCode.toString()).firstOrNull();
        final roomData = store.rooms;
        print("mh: ${plan?.map((e) => e.toJson())}");
        return Container(child:  Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Trainer Details",style: TextStyle(fontSize: 20),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Trainer Name :'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(trainerData?.trName??''),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Trainer Email : ${trainerData?.trainerMail??''}'),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.mail),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Plan Details",style: TextStyle(fontSize: 20),),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(plan?.first.invoiceDetail?.invoiceItemDiscription??''),
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Start Date :'),
                              ),
                              Text(plan?.first.fromDate??''),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('End Date :'),
                              ),
                              Text(plan?.first.toDate??''),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('End Time :'),
                              ),
                              Text('${plan?.first.invoiceDetail?.endTime}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Start Time :'),
                              ),
                              Text('${plan?.first.startTime}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Price",style: TextStyle(fontSize: 20),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Plan Price:'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${plan?.first.invoiceDetail?.invoiceItemPrice??''} AED'),
                          ),

                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Trainer Price:'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${trainerData?.price??'0'} AED'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Room Details",style: TextStyle(fontSize: 20),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Room Name:'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(roomData?.roomDetails?.first.floorNo??''),
                          ),

                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Room No:'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${roomData?.roomDetails?.first.sno??''}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                      elevation:2,
                        color: FlutterFlowTheme.of(context).primary,
                        onPressed: () {
                        showDialog(context: context, builder: (context)=> RoomSelect(roomId:scedule.first.room_id,classId:scedule.first.id.toString(),viewOnly:true));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Mat No:'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(roomData?.roomSpotDetails?.firstWhere((element) => element.bookingCusId == sl<Configration>().custId).index??''),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ],));
      }
  );

  SceduleContainer CalenderView() => SceduleContainer(
        builder: (context,store,mutation) {
          final scedule = store.scedules.where((e)=>e.id.toString() == widget.sceduleId);
          return StaffTimlineCalender(
              StaffTimlineCalenderController.instance,
              calView: CalendarView.month,
              onTap: (event){
                if(event.appointments?.isEmpty??true){
                  /// SanchoCalenderController.instance.changeView(CalendarView.schedule);
                  /// SanchoCalenderController.removeAppointment( appointment);
                  if(event.resource!=null) {
                    StaffTimlineCalenderController.setAppointment((event.resource?.id??"").toString(), Appointment(resourceIds:[event.resource!.id.toString()],subject: event.resource!.id.toString(),startTime: event.date!, endTime: event.date!.add(const Duration(hours: 2))));
                  }
                }
                final params = (stored.pathParameters??{});
                if (kDebugMode) {
                  print("room id : ${event.appointments?.first.id}");
                }
                // navigate.push(context, name: Routename.room,parms: params,qparms: {
                //   'room_id':scedule.where((element) => element.id == event.appointments?.first.id).firstOrNull().room_id.toString()
                // });
                return false;
              },
              usersData: scedule.map((e) {
                e.days?.removeWhere((key, value) => value==null);
                final startDate = DateFormat('yyyy-MM-dd').parse(e.date!.first.startDate!);
                final endDate = DateFormat('yyyy-MM-dd').parse(e.date!.first.endDate!);
                final starttime = DateFormat('HH:mm:ss').parse(e.appointments!.first.startTime!);
                final endtime = DateFormat('HH:mm:ss').parse(e.appointments!.first.endTime!).subtract(const Duration(minutes: 2));
                return Person(id: e.id.toString(), name: e.title??'',
                    brake: [
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
        }
    );
}
