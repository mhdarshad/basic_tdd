import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DatePickerController {
  ValueNotifier<DateTime> _selectedDateTime = ValueNotifier<DateTime>(DateTime.now().add(const Duration(days: 1)));
  ValueNotifier<DateTime> get selectedDateTime => _selectedDateTime;
  set selectedDateTime(ValueNotifier<DateTime> value) =>_selectedDateTime = value;
  DatePickerController();
   format(String format){
    final DateFormat formatter = DateFormat(format);
    return formatter.format(selectedDateTime.value);
  }
}
