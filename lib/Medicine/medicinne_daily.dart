import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Medicine/list_medicine.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Iconss.dart';
import '../home_page.dart';

class MedicineDaily extends StatefulWidget {
  const MedicineDaily({super.key, required this.medicines});
  final Medicine medicines;
  @override
  State<MedicineDaily> createState() => _MedicineDailyState();
}

class _MedicineDailyState extends State<MedicineDaily> {
  final _controller = PageController();
  final _controller2 = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
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
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                              icon: SvgPicture.asset(
                                  'assets/images/PhoneCall.svg'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            BackButton(
                              color: Colors.deepOrangeAccent,
                            ),
                            Text(
                              'Dặn thuốc',
                              style: TextStyle(
                                  fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 5),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: _w,
                              height: _h * 1 / 8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFe8e8e8),
                                      blurRadius: 15,
                                      offset: Offset(0, -1))
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      top: 10,
                                      right: 10,
                                    ),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/image_medicine.png"),
                                      radius: 33,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat.yMd()
                                            .format(widget.medicines.date)
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: 'SFPRODISPLAYBOLD',
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${widget.medicines.status} bởi ${widget.medicines.teacher}',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: _w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 244, 229, 1),
                              ),
                              child: Center(
                                child: Text(
                                  'Đã tạo lúc ${widget.medicines.date.hour}:${widget.medicines.date.minute}, ngày ${DateFormat.yMd().format(widget.medicines.date)}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Stack(children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: _w,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: PageView.builder(
                                          controller: _controller,
                                          itemCount: 3,
                                          itemBuilder: (context, index) =>
                                              Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/medicine_2.png")),
                                                ),
                                              )),
                                    ),
                                    SmoothPageIndicator(
                                      controller: _controller,
                                      count: 3,
                                      effect: ScaleEffect(
                                          dotHeight: 6,
                                          dotWidth: 6,
                                          activeDotColor: Colors.deepOrange),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => DialogPage(
                                          h: _h,
                                          controller2: _controller2,
                                          w: _w));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 15, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 5),
                                        width: 70,
                                        height: 21,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Colors.grey),
                                        child: Text(
                                          'Xem chi tiết',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              height: 190,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFe8e8e8),
                                      blurRadius: 10,
                                      offset: Offset(0, 8))
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Ngày một viên, uống vào bữa chiều.\nKhi có triệu chứng về tiêu hóa (khó tiêu, đi ngoài...) ngừng sử dụng và liên hệ bác sĩ.\nKhông sử dụng quá 3 tháng',
                                  style: TextStyle(
                                    color: Color(0xFF232323),
                                    fontSize: 15,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(242, 242, 242, 1),
                                        ),
                                        child: Icon(
                                          Icons.notifications_off,
                                          size: 30.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text('Tắt dặn thuốc',
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text(
                                              'Xác nhận xóa',
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            content: Container(
                                              height: _h * 1 / 7,
                                              child: Column(children: [
                                                Text(
                                                  'Bạn chắc chắn muốn\nxóa dặn thuốc này?',
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 0.2,
                                                  width: _w,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                          child: Text(
                                                            'Huỷ',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 20),
                                                          )),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Xoá',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepOrange,
                                                                fontSize: 20),
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ),
                                        ); // do something
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(255, 89, 89, 1),
                                        ),
                                        child: Icon(
                                          Icons.delete_forever_rounded,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Xoá',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 89, 89, 1)),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogPage extends StatelessWidget {
  const DialogPage({
    super.key,
    required double h,
    required PageController controller2,
    required double w,
  })  : _h = h,
        _controller2 = controller2,
        _w = w;

  final double _h;
  final PageController _controller2;
  final double _w;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90, left: 10, right: 10),
          child: SizedBox(
            height: _h * 0.6,
            child: PageView.builder(
              controller: _controller2,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Column(children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Chi tiết thuốc',
                                style: TextStyle(
                                  fontFamily: 'SFPRODISPLAYBOLD',
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 0.2,
                        width: _w,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset("assets/images/medicine_2.png"),
                      Container(
                        height: 0.1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text(
                              'Thuốc ho\nUống 1 viên một lần\nSau ăn',
                              style: TextStyle(
                                color: Color(0xFF232323),
                                fontSize: 15,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: _controller2,
          count: 3,
          effect: ScaleEffect(
              dotHeight: 6, dotWidth: 6, activeDotColor: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 92,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(35, 35, 35, 1)),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Đóng',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
