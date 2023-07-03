class Medicine {
  final DateTime date;
  final String status, teacher, message;
  final int quantity;
  Medicine({
    required this.date,
    required this.status,
    required this.teacher,
    required this.message,
    required this.quantity,
  });
}

List<Medicine> listMedicine = [
  Medicine(
      date: DateTime(2022,09,18),
      status: 'Đã xác nhận',
      teacher: 'Cô Nguyễn Mai',
      message:
          'Ngày một viên, uống vào bữa chiều sau khi ăn từ 30 đến 40 phút nhé baby',
      quantity: 2),
  Medicine(
      date: DateTime(2022,03,12),
      status: 'Chưa xác nhận',
      teacher: '',
      message:
          'Ngày một viên, uống vào bữa chiều sau khi ăn từ 30 đến 40 phút nhé baby',
      quantity: 3),
  Medicine(
      date: DateTime(2022,02,12),
      status: 'Đã hoàn thành',
      teacher: 'Cô Nguyễn Mai',
      message:
          'Nay bé hơi bị ho, anh chị để ý bé nhé thành thành thành thành thành thành',
      quantity: 5),
];
