
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../calender_view_modle/calender_view_modle.dart';
import '../controller/calender_controller.dart';

class StaffTimlineCalender extends StatefulWidget {

  final List<Person> usersData;
  final Function(CalendarTapDetails)? onTap;
  final Function(AppointmentDragUpdateDetails)? onDraged;
  final Function(AppointmentResizeEndDetails)? onAppointmentResizeed;
  final Widget Function(BuildContext, CalendarAppointmentDetails)? eventViewBuilder;
  const StaffTimlineCalender({Key? key, required this.usersData, this.onTap, this.onDraged, this.onAppointmentResizeed, this.eventViewBuilder}): super(key: key);

  @override
  State<StaffTimlineCalender> createState() => _StaffTimlineCalenderState();

  changeCalenderView() {}
}

class _StaffTimlineCalenderState extends State<StaffTimlineCalender> {
  final StaffTimlineCalenderController controller = StaffTimlineCalenderController.instance;
  @override
  void initState() {
    controller.addStaffs = widget.usersData;
    controller.initalize();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: controller.isShowFab,
        builder: (context,value,_){
          return value?FloatingActionButton(onPressed: ()=>controller.onClickFabButton(),child: const Icon(Icons.edit_calendar),):SizedBox.shrink();
        },
      ),
        body:  SfCalendar(
          controller: controller.controller,
          allowDragAndDrop: true,
            allowAppointmentResize: true,
          onAppointmentResizeEnd: widget.onAppointmentResizeed,
          // allowViewNavigation: true,
            cellBorderColor: Colors.green,
            showCurrentTimeIndicator:true,
            monthViewSettings: const MonthViewSettings(navigationDirection:MonthNavigationDirection.vertical ,showAgenda: true,appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
            viewNavigationMode: ViewNavigationMode.snap,
            allowedViews: const [
              CalendarView.timelineDay,
              CalendarView.timelineWeek,
              CalendarView.month,
              CalendarView.schedule
            ],
            scheduleViewSettings:const ScheduleViewSettings(appointmentTextStyle:TextStyle(color: Colors.black),hideEmptyScheduleWeek: true,monthHeaderSettings: MonthHeaderSettings(height: 60,textAlign: TextAlign.center),weekHeaderSettings: WeekHeaderSettings()),
          showNavigationArrow: true,
          dragAndDropSettings: controller.draganddropSettings,
            onDragStart: (arguments){
              print("Drag Started");
            },
            onDragEnd: (arguments){
              print("Drag End");
            },
            appointmentBuilder:widget.eventViewBuilder,
            onDragUpdate: widget.onDraged,
            onTap:(event) {
            if(controller.isMonthViewClick(event)){
            }else if(controller.isScheduleViewClick(event)){
              controller.changeView(CalendarView.timelineDay);
              }else if(controller.isScheduleViewClickWeekHeader(event)){
              controller.changeView(CalendarView.timelineWeek);
             }
              widget.onTap!(event);
            },
            view: CalendarView.timelineDay,
            firstDayOfWeek: 1,
            showDatePickerButton: true,
            timeSlotViewSettings: const TimeSlotViewSettings(startHour: 0, endHour: 24,nonWorkingDays: <int>[DateTime.friday, DateTime.saturday]),
            dataSource: controller.events,
            specialRegions: controller.brakeTime /// Un Available Time Regions
        ));
  }
}

