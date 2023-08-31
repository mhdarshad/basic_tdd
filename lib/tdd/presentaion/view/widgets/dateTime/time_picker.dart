import 'package:flutter/material.dart';

import '../../../../../core/util/presentation/flutter_flow/flutter_flow_theme.dart';
import '../../../../../core/util/presentation/flutter_flow/flutter_flow_util.dart';

class DateRangePicker extends StatelessWidget {
  final TimeStatus from;
  final DateTime initialTime;
  final DateTime endDate;
  final bool viewOnly;

  const DateRangePicker({
    required this.from,
    super.key,
    required this.initialTime,
    required this.viewOnly,
    required this.endDate,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
      child:  MaterialButton(
        // color: FlutterFlowTheme.of(context).primaryBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () async{
          if(!viewOnly){
            SceduleUserDetailModel.selectDOB(await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 36525)), initialDate: DateTime.now()));
          }
        },
        child: ValueListenableBuilder<DateTime?>(
            valueListenable: SceduleUserDetailModel.dateController,
            builder: (context,store,state) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            store!=null?'From \nTo :':'From : \nTo :  ',
                            style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Lexend Deca',
                              color:FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            store!=null?'${DateFormat('dd-MM-yyyy').format(store)} \n ${DateFormat('dd-MM-yyyy').format(endDate)} ':'${DateFormat('dd-MM-yyyy').format(initialTime)} \n${DateFormat('dd-MM-yyyy').format(endDate)} ',
                            style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Lexend Deca',
                              color:FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
class SceduleUserDetailModel {
  static ValueNotifier<DateTime?> dateController = ValueNotifier(null);
  static ValueNotifier<TimeOfDay?> fromTimeController = ValueNotifier(null);
  static ValueNotifier<TimeOfDay?> toTimeController = ValueNotifier(null);
  static void selectTime(TimeStatus type, TimeOfDay? timeOfDay) {
    switch(type){
      case TimeStatus.from:
      // TODO: Handle this case.
        fromTimeController.value = timeOfDay;
        break;
      case TimeStatus.to:
      // TODO: Handle this case.
        toTimeController.value = timeOfDay;
        break;
    }
  }
  static void selectDOB(DateTime? date){
    dateController.value = date;
    dateController.notifyListeners();
  }
}
enum TimeStatus{
  from,to
}