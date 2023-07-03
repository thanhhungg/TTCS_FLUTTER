import 'package:get/get.dart';

class Chat {
  final String name, lastMessage, image, time, position;
  final int count;
  final bool isActive;
  Chat({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    required this.count,
    required this.isActive,
    required this.position,
  });
}

List chatsData = [
  Chat(
      name: 'Cô Thúy Hạnh',
      lastMessage: 'Nay bé hơi bị ho, anh chị để ý bé\nnhé...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '3 phút trước',
      count: 1,
      isActive: true,
      position: 'Cô giáo chủ nhiệm Lớp 3A'),
  Chat(
      name: 'BQL Nhà Trường',
      lastMessage: 'Nhà Trường xin thông báo lịch đóng\nhọc..',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '07:17',
      count: 0,
      isActive: true,
      position: 'Hệ thống'),
  Chat(
      name: 'KidsOnline',
      lastMessage: 'Ứng dụng đã được cập nhập lên\nphiên...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: 'Hôm qua, 09:11',
      count: 0,
      isActive: true,
      position: 'Hệ thống'),
  Chat(
      name: 'Cô Thúy Hạnh',
      lastMessage: 'Nay bé hơi bị ho, anh chị để ý bé\nnhé...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '3 phút trước',
      count: 1,
      isActive: true,
      position: 'Cô giáo chủ nhiệm Lớp 3A'),
  Chat(
      name: 'Cô Thúy Hạnh',
      lastMessage: 'Nay bé hơi bị ho, anh chị để ý bé\nnhé...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '3 phút trước',
      count: 1,
      isActive: true,
      position: 'Cô giáo chủ nhiệm Lớp 3A'),
  Chat(
      name: 'Cô Thúy Hạnh',
      lastMessage: 'Nay bé hơi bị ho, anh chị để ý bé\nnhé...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '3 phút trước',
      count: 1,
      isActive: true,
      position: 'Cô giáo chủ nhiệm Lớp 3A'),
  Chat(
      name: 'Cô Thúy Hạnh',
      lastMessage: 'Nay bé hơi bị ho, anh chị để ý bé\nnhé...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '3 phút trước',
      count: 1,
      isActive: true,
      position: 'Cô giáo chủ nhiệm Lớp 3A'),
  Chat(
      name: 'Cô Thúy Hạnh',
      lastMessage: 'Nay bé hơi bị ho, anh chị để ý bé\nnhé...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '3 phút trước',
      count: 1,
      isActive: true,
      position: 'Cô giáo chủ nhiệm Lớp 3A'),
  Chat(
      name: 'Cô Thúy Hạnh',
      lastMessage: 'Nay bé hơi bị ho, anh chị để ý bé\nnhé...',
      image: 'https://cdn.pixabay.com/photo/2017/08/19/19/34/c3_960_720.jpg',
      time: '3 phút trước',
      count: 1,
      isActive: true,
      position: 'Cô giáo chủ nhiệm Lớp 3A'),
];
