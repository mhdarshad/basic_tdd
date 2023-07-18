
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../calender_view_modle/calender_view_modle.dart';
import '../controller/calender_controller.dart';

class StaffTimlineCalender2 extends StatefulWidget {

  final List<Person> usersData;
  final CalendarView calView;
  final Function(CalendarTapDetails)? onTap;
  final Function(AppointmentDragUpdateDetails)? onDraged;
  final Function(AppointmentResizeEndDetails)? onAppointmentResizeed;
  final StaffTimlineCalenderController controller;
  final Widget Function(BuildContext, CalendarAppointmentDetails)? eventViewBuilder;
  const StaffTimlineCalender2(this.controller,{Key? key, required this.usersData, this.onTap, this.onDraged, this.onAppointmentResizeed, this.eventViewBuilder,required this.calView,  }): super(key: key);

  @override
  State<StaffTimlineCalender2> createState() => _StaffTimlineCalenderState();

  changeCalenderView() {}
}

class _StaffTimlineCalenderState extends State<StaffTimlineCalender2> {
   final StaffTimlineCalenderController stafTimeline = StaffTimlineCalenderController.instance;
  @override
  void initState() {
    // stafTimeline = widget.controller;
    stafTimeline.addStaffs = widget.usersData;
    stafTimeline.controller.view = widget.calView;
    stafTimeline.initalize();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    stafTimeline.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: ValueListenableBuilder<bool>(
        //   valueListenable: controller.isShowFab,
        //   builder: (context,value,_)=>value?FloatingActionButton(onPressed: ()=>controller.onClickFabButton(),child: const Icon(Icons.edit_calendar),):const SizedBox.shrink(),
        // ),
        body:  SfCalendar(
            controller: stafTimeline.controller,
            allowDragAndDrop: true,
            allowAppointmentResize: true,
            onAppointmentResizeEnd: widget.onAppointmentResizeed,
            // allowViewNavigation: true,
            cellBorderColor: Colors.green,
            showCurrentTimeIndicator:true,
            monthViewSettings: const MonthViewSettings(navigationDirection:MonthNavigationDirection.vertical ,showAgenda: true,appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
            viewNavigationMode: ViewNavigationMode.snap,
            allowedViews: const [
              // CalendarView.timelineDay,
              // CalendarView.timelineWeek,
              // CalendarView.month,
              // CalendarView.month
            ],
            monthCellBuilder: (context,cell)=>Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                // margin: const EdgeInsets.all(100.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(40)
                  ),
                  border: Border.all(
                    width: 3,
                    color: Colors.green,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children:  [
                  Expanded(flex:2,
                      child: Center(child: Text("${cell.date.day}",style: const TextStyle(fontSize: 20),))),
                    Expanded(child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: const BorderRadius.only(
                              bottomLeft:Radius.circular(40),
                              bottomRight:Radius.circular(40)
                          ),
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                            style: BorderStyle.solid,
                          ),
                        ),child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${cell.appointments.length}"),
                          ],
                        ))
                    )
                ],),
              ),
            ),
            scheduleViewSettings:const ScheduleViewSettings(appointmentTextStyle:TextStyle(color: Colors.black),hideEmptyScheduleWeek: true,monthHeaderSettings: MonthHeaderSettings(height: 60,textAlign: TextAlign.center),weekHeaderSettings: WeekHeaderSettings()),
            // showNavigationArrow: true,
            dragAndDropSettings: stafTimeline.draganddropSettings,
            onDragStart: (arguments){
              if (kDebugMode) {
                print("Drag Started");
              }
            },
            onDragEnd: (arguments){
              if (kDebugMode) {
                print("Drag End");
              }
            },
            appointmentBuilder:widget.eventViewBuilder,
            onDragUpdate: widget.onDraged,
            onTap:(event) {
              if(stafTimeline.isMonthViewClick(event)){
                // controller.changeView(CalendarView.timelineDay);
              }else if(stafTimeline.isScheduleViewClick(event)){
                // controller.changeView(CalendarView.timelineDay);
              }else if(stafTimeline.isScheduleViewClickWeekHeader(event)){
                // controller.changeView(CalendarView.timelineWeek);
              }
              if(widget.onTap!=null) {
                widget.onTap!(event);
              }
            },
            view:widget.calView,
            firstDayOfWeek: 1,
            showDatePickerButton: true,
            timeSlotViewSettings: const TimeSlotViewSettings(startHour: 0, endHour: 24,nonWorkingDays: <int>[DateTime.friday, DateTime.saturday]),
            dataSource: stafTimeline.events,
            specialRegions: stafTimeline.brakeTime /// Un Available Time Regions
        ));
  }
}