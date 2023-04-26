import 'package:intl/intl.dart';

String get dateTimeNowString => DateTime.now().toString();
extension StringDateTime on String{
  DateTime? get toDateTime=>DateTime.tryParse(this);
  DateTime? get toLocalDateTime=>DateTime.tryParse(this)!=null?DateTime.tryParse(this)!.toLocal():null;
  String? get toServerDateTimeString=>toLocalDateTime!=null?toLocalDateTime.toString():null;
  String get toDDMMYYHMAFormat =>toLocalDateTime!=null?DateFormat('yyyy-MM-dd hh:mm a').format(toLocalDateTime!):'';
}