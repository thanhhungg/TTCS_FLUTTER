import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

class ViMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'trước';
  @override
  String suffixFromNow() => 'từ bây giờ';
  @override
  String lessThanOneMinute(int seconds) => 'một phút';
  @override
  String aboutAMinute(int minutes) => 'khoảng một phút';
  @override
  String minutes(int minutes) => '$minutes phút';
  @override
  String aboutAnHour(int minutes) => 'khoảng một giờ';
  @override
  String hours(int hours) => '$hours giờ';
  @override
  String aDay(int hours) => 'một ngày';
  @override
  String days(int days) => '$days ngày';
  @override
  String aboutAMonth(int days) => 'khoảng một tháng';
  @override
  String months(int months) => '$months tháng';
  @override
  String aboutAYear(int year) => 'khoảng một năm';
  @override
  String years(int years) => '$years năm';
  @override
  String wordSeparator() => ' ';
}
