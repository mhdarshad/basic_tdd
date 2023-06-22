import 'dart:math';

import 'package:calender_view_snacho/calender_page/calender_view_modle/calender_view_modle.dart';
import 'package:calender_view_snacho/calender_page/controller/calender_controller.dart';
import 'package:calender_view_snacho/calender_page/desktop_web/calender_view_desk_top.dart';
import 'package:cloud_me_v2/core/usecases/usecase.dart';
import 'package:cloud_me_v2/core/util/calculations/convert.dart';
import 'package:cloud_me_v2/core/util/presentation/template/custom_scafold.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/scedule/scedule_consumer.dart';
import 'package:cloud_me_v2/tdd/presentaion/modules/scedule/scedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../../injection_container.dart';
import '../../../widgets/calender_view/calender_page/controller/calender_controller.dart';
import '../../../widgets/calender_view/calender_page/desktop_web/calender_view_desk_top.dart';

class SceduleListing extends StatefulWidget {
  const SceduleListing({Key? key}) : super(key: key);

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

    List<Person> user = [
      {
        "id": "1",
        "name": "John",
        "brake": [
          {"startTime": null, "endTime": null}
        ],
        "imageUrl": "",
        "appointments": [
          {"startTime": null, "endTime": null}
        ]
      },  {
        "id": "2",
        "name": "John",
        "brake": [
          {"startTime": null, "endTime": null}
        ],
        "imageUrl": "",
        "appointments": [
          {"startTime": null, "endTime": null}
        ]
      },  {
        "id": "3",
        "name": "John",
        "brake": [
          {"startTime": null, "endTime": null}
        ],
        "imageUrl": "4",
        "appointments": [
          {"startTime": null, "endTime": null}
        ]
      }, {
        "id": "5",
        "name": "John",
        "brake": [
          {"startTime": null, "endTime": null}
        ],
        "imageUrl": "",
        "appointments": [
          {"startTime": null, "endTime": null}
        ]
      }, {
        "id": "6",
        "name": "John",
        "brake": [
          {"startTime": null, "endTime": null}
        ],
        "imageUrl": "",
        "appointments": [
          {"startTime": null, "endTime": null}
        ]
      },
    ].map((e) => Person(id: e['id'].toString(),
        name: e['name'].toString(),
        brake: (e['brake'] as List).map((e)=>TimeRegion(startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 13, 0, 0),endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0, 0),)).toList(),
        imageUrl: e['imageUrl'].toString(),
        appointments: (e['brake'] as List).map((b) {
          final DateTime date = DateTime.now().add(const Duration(days: 1));
          int startHour = 9 + Random().nextInt(6);
          startHour =
          startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
          final DateTime shiftStartTime =
          DateTime(date.year, date.month, date.day, startHour, 0, 0);
          return Appointment(resourceIds:[ e['id'].toString()],startTime: shiftStartTime, endTime: shiftStartTime.add(const Duration(hours: 1)),);
        }).toList())).toList();

    return  /*SfCalendar();*/ProjectScafold(child: // Generated code for this Column Widget...
    // Generated code for this Column Widget...
    SceduleContainer(
      builder: (context,store,mutation) {
        final scedule = store.scedules;
        return StaffTimlineCalender(
          /// eventViewBuilder: (context,data){
          ///   final appointment = (data.appointments.first as Appointment);
          ///   return GestureDetector(onTap:()=>print("isMoreAppointmentRegion ${appointment}"),child: Container(color: Colors.green,child: Center(child: Text(appointment.subject)),));
          /// },
            onTap: (event){
              if(event.appointments?.isEmpty??true){
                /// SanchoCalenderController.instance.changeView(CalendarView.schedule);
                /// SanchoCalenderController.removeAppointment( appointment);
                StaffTimlineCalenderController.setAppointment((event.resource?.id??"").toString(), Appointment(resourceIds:[event.resource!.id.toString()],subject: event.resource!.id.toString(),startTime: event.date!, endTime: event.date!.add(const Duration(hours: 2))));
              }
            }, usersData: scedule.map((e) => Person(id: e.id.toString(), name: e.title??'', brake: [], imageUrl: "imageUrl", appointments:  e.appointments?.map((a) => Appointment(startTime: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,"${a.startTime}".toDateTime?.hour??0,"${a.startTime}".toDateTime?.minute??0,), endTime:DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,"${a.endTime}".toDateTime?.hour??0,"${a.endTime}".toDateTime?.minute??0,))).toList()??[])).toList());
      }
    )
    );
  }
}
