import 'package:get/get.dart';
class Absence{
  final String request,status;
  final DateTime day;
  final int id;
  const Absence({
    required this.day,
    required this.request,
    required this.status,
    required this.id
  });
}
List<Absence> listAbsence = [
  Absence(day: DateTime(2023, 4, 19), request: 'Nghỉ có phép', status: 'Đã xác nhận',id:0),
  Absence(day: DateTime(2023, 4, 2), request: 'Nghỉ không phép', status: 'Chưa xác nhận',id:1),
  Absence(day: DateTime(2023, 4, 13), request: 'Đi muộn', status: 'Vào lớp lúc 09:40',id:2),
  Absence(day: DateTime(2023, 5, 4), request: 'Nghỉ có phép', status: 'Đã xác nhận',id:0),
  Absence(day: DateTime(2023, 4, 15), request: 'Đúng giờ', status: 'Vào lớp lúc 08:32',id:3),

].obs;