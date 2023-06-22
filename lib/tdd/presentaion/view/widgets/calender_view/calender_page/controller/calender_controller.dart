// import 'dart:math';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
//
// import '../calender_view_modle/calender_view_modle.dart';
//
// abstract class StaffTimlineCalenderController{
//   MeetingDataSource? events;
//   late List<TimeRegion> brakeTime;
//    set addStaffs(List<Person> users) ;
//    final ValueNotifier<bool>  isShowFab =  ValueNotifier(false);
//    final  CalendarController controller =  CalendarController();
//    final DragAndDropSettings draganddropSettings = const DragAndDropSettings();
//    static StaffTimlineCalenderController _instance = CalenderControllerImpl();
//    static StaffTimlineCalenderController get instance => _instance;
//    static set instance(StaffTimlineCalenderController instance) => _instance = instance;
//   static setAppointment(String uid,Appointment appointment) => instance._addAppointment(uid, appointment);
//   static removeAppointment(Appointment appointment) => instance._removeAppointment(appointment);
//   // changeView(CalendarView view)=>instance.changeView(view);
//   /// Available Trough Intense
//    void initalize();
//    void changeView(CalendarView view);
//    void _addAppointment(String uid, Appointment appointment);
//    void _removeAppointment(Appointment appointment);
//   onClickFabButton();
//   bool isMonthViewClick(CalendarTapDetails event) => (event.targetElement ==CalendarElement.calendarCell && controller.view == CalendarView.month && (event.appointments?.isEmpty??false));
//   bool isScheduleViewClick(CalendarTapDetails event) => (event.targetElement ==CalendarElement.calendarCell && controller.view == CalendarView.schedule);
//   bool isScheduleViewClickWeekHeader(CalendarTapDetails event) => (event.targetElement ==CalendarElement.viewHeader && controller.view == CalendarView.schedule);
// }
//
// class CalenderControllerImpl extends StaffTimlineCalenderController {
//   List<Person> _users = [];
//   @override
//   set addStaffs(List<Person> users) => _users = users;
//   @override
//   void _addAppointment(String uid, Appointment appointment) => events?.notifyListeners(CalendarDataSourceAction.add, [appointment]);
//   @override
//   void _removeAppointment(Appointment appointment) => events?.notifyListeners(CalendarDataSourceAction.add, [events?.appointments?.where((element ) => (element as Appointment) == appointment)]);
//   _assignUserDataToTable() {
//     final usersData = _users.map<CalendarResource>((e) =>CalendarResource(
//       id: e.id,
//       displayName: e.name,
//       color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),Random().nextInt(255), 1),
//       image:null,
//       // e.imageUrl.isNotEmpty ? NetworkImage(e.imageUrl) : null
//     )
//     ).toList();
//     final appointmentList = _users.fold<List<Appointment>>([],(list,e) => [...list,...e.appointments]);
//     brakeTime = _users.fold<List<TimeRegion>>([],(list,user) => [...list,...user.brake.map((e) => TimeRegion(resourceIds:[user.id],startTime: e.startTime, endTime: e.endTime,text: e.text,enablePointerInteraction: false,iconData: Icons.timelapse))]);
//     events = MeetingDataSource(appointmentList, usersData);
//     events?.notifyListeners(CalendarDataSourceAction.addResource, usersData);
//   }
//   @override
//   initalize() {
//     _assignUserDataToTable();
//     controller.addPropertyChangedListener((p0) {
//       print("Property Change Listener:$p0 ${controller.view}");
//       if(p0 == 'calendarView'){
//         isShowFab.value = !(controller.view == CalendarView.timelineDay)&& !(controller.view == CalendarView.timelineWeek);
//         if (kDebugMode) {
//           print("is time line :${!(controller.view == CalendarView.timelineDay)} AND ${!(controller.view == CalendarView.timelineWeek)} ${isShowFab.value}");
//         }
//         isShowFab.notifyListeners();
//       }
//     });
//   }
//
//   @override
//   MeetingDataSource? events;
//
//   @override
//   List<TimeRegion> brakeTime =[];
//
//   @override
//   onClickFabButton() {
//     print("Display Date:${controller.displayDate} Selected Date :${controller.selectedDate}");
//     // final date = controller.selectedDate??controller.displayDate??DateTime.now();
//     switch(controller.view){
//
//       case CalendarView.day:
//         break;
//       case CalendarView.week:
//         break;
//       case CalendarView.workWeek:
//         break;
//       case CalendarView.month:
//         controller.view = CalendarView.timelineDay;
//         break;
//       case CalendarView.timelineDay:
//         break;
//       case CalendarView.timelineWeek:
//         break;
//       case CalendarView.timelineWorkWeek:
//         break;
//       case CalendarView.timelineMonth:
//         break;
//       case CalendarView.schedule:
//         controller.view = CalendarView.timelineDay;
//         break;
//       default:
//         break;
//     }
//   }
//
//   @override
//   void changeView(view) {
//     controller.view = view;
//   }
// }
//
