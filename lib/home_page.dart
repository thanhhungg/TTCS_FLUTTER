import 'package:flutter/material.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_application_2/user_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shimmer/shimmer.dart';
import 'Feature/feature_page.dart';
import 'services/action_connect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> listItems = <String>[
    "Tất cả",
    "Tin quan trọng",
    "Tin từ nhà trường",
    "Tin từ lớp A3"
  ];
  String? selectedValue = 'Tất cả';
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: _w,
                height: _h * 1 / 6,
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
                            '    KIDS\nONLINES',
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
                            icon:
                                SvgPicture.asset('assets/images/PhoneCall.svg'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Container(
                        height: _h * 1 / 9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFe8e8e8),
                              blurRadius: 5.0,
                              offset: Offset(0, 5),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5, 0),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(5, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        // minRadius: 22,
                                        maxRadius: 28,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: SvgPicture.asset(
                                          'assets/images/Female.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bạn đang xem thông tin của',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'SFPRODISPLAYLIGHTITALIC',
                                      ),
                                    ),
                                    Text(
                                      'Đặng Nhật Minh',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SFPRODISPLAYBOLD',
                                      ),
                                    ),
                                    Text(
                                      '22A3003.Lớp A3 (2019 - 2023)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'SFPRODISPLAYLIGHTITALIC',
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserPage()));
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/images/control.svg'))
                              ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Container(
                        width: _w,
                        height: _h * 1 / 14,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 221, 201, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tiện ích nhanh',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFPRODISPLAYBOLD',
                                    fontSize: 18,
                                  )),
                              // TextButton(
                              //     onPressed: () {
                              //       setState(() {
                              //         // Get.to(FeaturePage());
                              //       });
                              //     },
                              //     child: Text(
                              //       'Chỉnh sửa',
                              //       style: TextStyle(
                              //         color: Colors.blue,
                              //         fontFamily: 'SFPRODISPLAYLIGHT',
                              //         fontSize: 15,
                              //       ),
                              //     ))
                            ],
                          ),
                        ),
                        Container(
                            child: Obx(
                          () => Wrap(
                            runSpacing: 2,
                            spacing: 40,
                            children:
                                List.generate(features_gim.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    IconButton(
                                        iconSize: 60,
                                        onPressed: () {
                                          Get.to(
                                              features_gim[index].iteamScreen,
                                              transition: Transition.fade);
                                        },
                                        icon: SvgPicture.asset(
                                            features_gim[index].iteamImages)),
                                    Text(
                                      features_gim[index].iteamName,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bảng tin',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFPRODISPLAYBOLD',
                                    fontSize: 18,
                                  )),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                        style: BorderStyle.solid)),
                                child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          items: listItems
                                              .map((e) =>
                                                  DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(
                                                        e,
                                                        style: e ==
                                                                selectedValue
                                                            ? TextStyle(
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.blue,
                                                                fontFamily:
                                                                    'SFPRODISPLAYBOLD')
                                                            : TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'SFPRODISPLAYBOLD'),
                                                      )))
                                              .toList(),
                                          value: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value;
                                            });
                                          },
                                        ))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(15, 1, 15, 0),
                            child: FutureBuilder(
                              future: fetchData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 15, 0),
                                        child: Container(
                                          height: 50,
                                          width: _w,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.2),
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(15)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.sports_soccer),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        "Hoạt động hôm nay (15/08/2022)"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 1, 15, 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.2),
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(15)),
                                          ),
                                          width: _w,
                                          height: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  "${snapshot.data[index].time.substring(1, 6)}",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          Font
                                                                              .font,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Text(""),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${snapshot.data[index].title}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                                Opacity(
                                                                  opacity: 0.5,
                                                                  child: Text(
                                                                    "${snapshot.data[index].subtitle}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("loading data failed");
                                }
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 15, 0),
                                      child: Container(
                                        width: _w,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.2),
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(15)),
                                        ),
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[350]!,
                                          highlightColor: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 15, 90, 15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 1, 15, 0),
                                      child: Container(
                                        width: _w,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.2),
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(15)),
                                        ),
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.grey[350]!,
                                            highlightColor: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: ListView.builder(
                                                itemCount:
                                                    snapshot.data?.length,
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              width: 40,
                                                              height: 15,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            Text(""),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 90,
                                                              height: 15,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 2,
                                                            ),
                                                            Container(
                                                              width: _w / 2,
                                                              height: 15,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 4,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                );
                              },
                            )),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void mySheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Liên hệ hỗ trợ",
                style: TextStyle(fontFamily: Font.font, fontSize: 20)),
            // IconButton(onPressed:Navigator.pop(context) , icon:Icon(Icons.camera_outlined)),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async =>
                          await FlutterPhoneDirectCaller.callNumber(
                              '0384357102'),
                      icon: Icon(
                        Icons.call,
                        color: Colors.deepOrange,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Gọi Trường Mầm non Họa Mi",
                      style: TextStyle(fontFamily: Font.font, fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async =>
                          await FlutterPhoneDirectCaller.callNumber(
                              '0384357102'),
                      icon: Icon(
                        Icons.call,
                        color: Colors.deepOrange,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Gọi Tổng đài Ứng dụng quản lý\nKidsOnline",
                      style: TextStyle(fontFamily: Font.font, fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.2,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async =>
                          await FlutterPhoneDirectCaller.callNumber(
                              '0384357102'),
                      icon: Icon(
                        Icons.mail,
                        color: Colors.deepOrange,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                      "Trong trường hợp không khẩn cấp, bạn có thể liên hệ\nvới chúng tôi thông qua địa chỉ email\nsupport@kidsonline. Chúng tôi sẽ phản hồi nhanh\nnhất các thông tin bạn cung cấp!",
                      style: TextStyle(fontSize: 12)),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Bạn thích hay không thích ứng dụng này?",
                style: TextStyle(fontFamily: Font.font, fontSize: 18)),
            SizedBox(
              height: 10,
            ),
            Text("Vui lòng đánh giá trên Apple Store",
                style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 20,
            ),
            RatingBar.builder(
                itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                    ),
                onRatingUpdate: (rating) {})
          ],
        );
      });
}
