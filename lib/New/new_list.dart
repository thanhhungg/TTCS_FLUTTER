class News {
  final String name, captions, time, iteamImages;
  final int heart, comments,vip;
  News(
      {required this.name,
      required this.captions,
      required this.time,
      required this.iteamImages,
      required this.heart,
      required this.comments,
      required this.vip
      });
}

List<News> listNew = [
  News(
    name: 'Nhà trường đăng một thông báo mới',
    captions: 'Thông báo kế hoạch tổ chức dã ngoại học kỳ II cho các bé Lớp A3',
    time: '3 giờ trước',
    iteamImages: 'assets/images/image3.png',
    heart: 7,
    comments: 4,
    vip:1
  ),
  News(
    name: 'Cô Thúy Hạnh đã đăng bài viết mới',
    captions: 'Chùm ảnh các bé tham quan bảo tàng Dân tộc ngày 15/08',
    time: '17 giờ trước',
    iteamImages: 'assets/images/image3.png',
    heart: 7,
    comments: 4,
    vip: 0
  ),
  News(
    name: 'Nhà trường đăng một thông báo mới',
    captions: 'Thông báo thời gian hoàn thành học phí Học Kỳ II',
    time: 'Hôm qua',
    iteamImages: 'assets/images/image3.png',
    heart: 7,
    comments: 4,
    vip: 1
  ),
];
