import 'package:calender_view_snacho/calender_page/calender_view_modle/calender_view_modle.dart';
import 'package:calender_view_snacho/calender_page/controller/calender_controller.dart';
import 'package:calender_view_snacho/calender_page/desktop_web/calender_view_desk_top.dart';
import 'package:cloud_me_v2/tdd/presentaion/view/components/gym_page/scedule_listing/scedule_listing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_util.dart';
import '../../../../../injection_container.dart';
import '../../../../domain/entities/vx_store.dart';
import '../../../modules/scedule/scedule_consumer.dart';
import '../../../modules/scedule/scedule_controller.dart';

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
    sl<SceduleEvent>()(data: NoPrams());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(bottom:  const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.calendar_month)),
            Tab(icon: Icon(Icons.info)),
          ],
        ),),
        body: TabBarView(
          children: [
            CalenderView(),
            SceduleInformation()
          ],
        ),
      ),
    );
  }

  Widget SceduleInformation() =>SceduleContainer(
      builder: (context,store,mutation) {
        final scedule = store.scedules.where((e)=>e.id.toString() == widget.sceduleId).toList();
final plan = stored.dashboard?.subscribedPlans?.where((element) => element.itemCode == scedule.first.planId).toList();
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
                          child: Text(plan?.first.invoiceDetail?.invoiceItemDiscription??''),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Trainer Contact :'),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.call),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${plan?.first.invoiceDetail?.invoiceItemPrice??''} AED'),
                        ),
                        const Text('Plan Price:'),
                      ],
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

  SceduleContainer CalenderView() {
    return SceduleContainer(
        builder: (context,store,mutation) {
          final scedule = store.scedules.where((e)=>e.id.toString() == widget.sceduleId);
          return StaffTimlineCalender(
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
        }
    );
  }
}
