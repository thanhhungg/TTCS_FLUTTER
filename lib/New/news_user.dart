import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';

import '../home_page.dart';
import 'new_list.dart';

class NewsUser extends StatelessWidget {
  const NewsUser({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    int likeCount = 12;
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Container(
          width: _w,
          height: _h * 1 / 7.5,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 121, 23, 1),
          ),
        ),
        SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '    KIDS\nONLINEs',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'QueulatUni',
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Trường mầm non Họa Mi',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SFPRODISPLAYBOLD',
                      fontSize: 15,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      mySheet(context);
                    },
                    icon: SvgPicture.asset('assets/images/PhoneCall.svg'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              BackButton(),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Tin tức',
                  style:
                      TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                ),
              ),
            ]),
            ListTile(
              leading: Icon(Icons.school_rounded),
              title: Opacity(
                  opacity: 0.5,
                  child: Text(news.name,
                      style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD', fontSize: 15))),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(news.captions,
                  style:
                      TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 20)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(children: [
                          Icon(
                            Icons.star_rounded,
                            size: 20,
                            color: Colors.amber,
                          ),
                          Text('Quan trọng',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'SFPRODISPLAYBOLD',
                                  color: Colors.white)),
                        ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Text(news.time,
                            style: TextStyle(
                                fontFamily: 'SFPRODISPLAYBOLD', fontSize: 12)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      LikeButton(
                        size: 20,
                        isLiked: isLiked,
                        likeCount: likeCount,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      LikeButton(
                        size: 20,
                        isLiked: isLiked,
                        likeCount: likeCount,
                        likeBuilder: (isLiked) {
                          if (isLiked) {
                            return Icon(
                              Icons.message_outlined,
                              size: 20,
                              color: Colors.red,
                            );
                          }
                          if (!isLiked) {
                            return Icon(
                              Icons.message_rounded,
                              size: 20,
                              color: Colors.grey,
                            );
                          }
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(news.iteamImages),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  "Căn cứ vào kế hoạch nhiệm vụ năm học 2019 - 2020 của trường mầm non Họa Mi.  Căn cứ vào điều kiện thực tế và chương trình học của trẻ MN. Trường MN Họa Mi xây dựng kế hoạch tổ chức thăm quan, dã ngoại di tích lịch sử ở địa phương như sau:  I.THỜI GIAN: Dự kiến: Mỗi điểm trường 1 ngày (Thời gian từ 7h30 - 9h30). II. ĐỊA ĐIỂM: Đình, chùa: Thôn Bái Uyên - Xã Liên Bão. Đình, chùa: Thôn Hoài Thị - Xã Liên Bão.  Đình, chùa: Thôn Hoài Trung - Xã Liên Bão..  III. NỘI DUNG:  - Ban giám hiệu nhà trường chủ động xây dựng kế hoạch, chỉ đạo giáo viên phối hợp với Ban đại diện phụ huynh các lớp để chuẩn bị và tổ chức chuyến tham quan cho trẻ đạt kết quả cao.  - Ban giám hiệu nhà trường chủ động liên hệ với lãnh đạo thôn, chủ trì nhà chùa, cụ từ trông nom đình làng, tạo điều kiện cho nhà trường tổ chức chuyến đi tham quan được thành công.  - Giáo viên chuẩn bị thẻ đeo trước ngực có đầy đủ các thông tin của trẻ... Các đồ dùng cá nhân của trẻ như: mũ hoặc ô che nắng, quần áo đồng phục của trường phù hợp với thời tiết cho trẻ, giáo viên phụ trách các lớp.  - Tổ chức cho trẻ tham quan đình, chùa tại địa phương để trẻ có được những  tình cảm thiêng liêng, ghi nhớ công ơn các anh hùng đã hy sinh để báo vệ tổ quốc, trẻ thấy được sự vẻ vang của dân tộc, những truyền thống tốt đẹp mà cha ông ta để lại.  - Phân công nhiệm vụ:  + Phụ trách chung: Đ/c Nguyễn Thị Bích Thủy - Chức vụ: Hiệu trưởng  + Đồng chí: Nguyễn Thị Thêu - Chức vụ: Phó hiệu trưởng- Chủ tịch công đoàn. + Đồng chí: Nguyễn Thị Thúy Hà - Chức vụ: Phó hiệu trưởng. + Đồng chí: Nguyễn Thị Hương - Chức vụ: Tổ trưởng chuyên môn khối 5-6 tuổi.  - Giáo viên phụ trách các lớp khối 4- 5 tuổi và 5-6 tuổi do các đ/c sau đây phụ trách:  TT Họ và tên Lớp TT Họ và tên Lớp  1 Lê Thị Hương 5 tuổi số 1 6 Nguyễn Thị Tâm 4tuổi số 1  2 Dương T. Thanh Huyền 5 tuổi số 2 7 Nguyễn Thị Phương 4 tuổi số 2  3 Nguyễn Thị Thiêm 5 tuổi số 3 8 Phạm Thị Tình 4 tuổi số 3  4 Nguyễn Thị Hoa 5 tuổi số 4 9 Nông Thị Ngọc 4 tuổi số 4  5 Nguyễn Thị Hương 5 tuổi số 5  - Các loại thuốc y tế thông thường, bông băng, "),
            ),
          ],
        ))
      ]),
    ));
  }
}
