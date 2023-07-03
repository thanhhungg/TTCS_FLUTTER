class DataPickup {
  final int id;
  final String name_parents, name, status, time;
  final String image;
  final DateTime day;
  const DataPickup({
    required this.id,
    required this.name_parents,
    required this.name,
    required this.status,
    required this.time,
    required this.image,
    required this.day,
  });
}

List<DataPickup> dataPickup = [
  DataPickup(
      id: 1,
      name: 'Mẹ',
      status: 'Đón sớm',
      time: '16:25',
      day: DateTime(2022, 08, 12),
      name_parents: 'Trương Ngọc Diệp',
      image: 'assets/images/Frame.jpg'),
  DataPickup(
      id: 2,
      name: 'Bố',
      status: 'Đón sớm',
      time: '16:25',
      day: DateTime(2022, 08, 12),
      name_parents: 'Đặng Hồng Đăng',
      image: 'assets/images/Frame.jpg'),
  DataPickup(
      id: 3,
      name: 'Bà',
      status: 'Đón sớm',
      time: '16:25',
      day: DateTime(2022, 08, 12),
      name_parents: 'Nguyễn Thị Như',
      image: 'assets/images/Frame.jpg'),
  DataPickup(
      id: 4,
      name: 'Bà',
      status: 'Đón sớm',
      time: '16:25',
      day: DateTime(2022, 08, 12),
      name_parents: 'Nguyễn Thị Như',
      image: 'assets/images/Frame.jpg'),
];
