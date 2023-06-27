import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calender_page/calender_view_modle/calender_view_modle.dart';
import 'calender_page/controller/calender_controller.dart';
import 'calender_page/desktop_web/calender_view_desk_top.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
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
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   Scaffold(body: StaffTimlineCalender(
          /// eventViewBuilder: (context,data){
          ///   final appointment = (data.appointments.first as Appointment);
          ///   return GestureDetector(onTap:()=>print("isMoreAppointmentRegion ${appointment}"),child: Container(color: Colors.green,child: Center(child: Text(appointment.subject)),));
          /// },
          onTap: (event){
        if(event.appointments?.isEmpty??true){
          /// SnachoCalenderController.instance.changeView(CalendarView.schedule);
          /// SnachoCalenderController.removeAppointment( appointment);
          StaffTimlineCalenderController.setAppointment(event.resource!.id.toString(), Appointment(
              resourceIds:[event.resource!.id.toString()],subject: event.resource!.id.toString(),startTime: event.date!, endTime: event.date!.add(const Duration(hours: 2))));
        }
      }, usersData: user)),
    );
  }
}