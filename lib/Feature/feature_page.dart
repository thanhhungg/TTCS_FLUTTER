import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Absence/AbsencePage.dart';
import '../Health/health_page.dart';
import '../Medicine/medicine_page.dart';
import '../Message/message_page.dart';
import '../New/news_page.dart';
import '../PickUp/pickup_page.dart';
import '../home_page.dart';
import 'feature_list.dart';

final features = <FeatureList>[
  FeatureList(
      iteamImages: "assets/images/conversation.svg",
      iteamName: "Tin nhắn",
      iteamScreen: MessagesPage()),
  FeatureList(
      iteamImages: "assets/images/medicine.svg",
      iteamName: "Dặn thuốc",
      iteamScreen: MedicinePage()),
  FeatureList(
      iteamImages: "assets/images/history-calendar.svg",
      iteamName: "Hoạt động\nngày",
      iteamScreen: MessagesPage()),
  FeatureList(
      iteamImages: "assets/images/news.svg",
      iteamName: "Tin tức",
      iteamScreen: NewsPage()),
  FeatureList(
      iteamImages: "assets/images/picture.svg",
      iteamName: "Album ảnh",
      iteamScreen: MessagesPage()),
  FeatureList(
      iteamImages: "assets/images/money.svg",
      iteamName: "Học phí",
      iteamScreen: MessagesPage()),
  FeatureList(
      iteamImages: "assets/images/copied.svg",
      iteamName: "Khảo sát",
      iteamScreen: MessagesPage()),
  FeatureList(
      iteamImages: "assets/images/highlighter.svg",
      iteamName: "Nhận xét\nđịnh kì",
      iteamScreen: MessagesPage())
].obs;
final features_gim = <FeatureList>[
  FeatureList(
      iteamImages: "assets/images/journey.svg",
      iteamName: "Đón về",
      iteamScreen: PickUpPage()),
  FeatureList(
      iteamImages: "assets/images/valentine.svg",
      iteamName: "Xin nghỉ",
      iteamScreen: AbsencePage()),
  FeatureList(
      iteamImages: "assets/images/Scales.svg",
      iteamName: "Chỉ số",
      iteamScreen: HealthPage()),
].obs;
final features_empty = <FeatureList>[
  FeatureList(
      iteamImages: "assets/images/Scales_empty.svg",
      iteamName: "",
      iteamScreen: MessagesPage())
].obs;

class FeaturePage extends StatefulWidget {
  const FeaturePage({super.key});

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    var index = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              child: Column(children: [
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
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tiện ích đã ghim',
                        style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD',
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(EditFeaturePage(),
                                transition: Transition.fadeIn);
                          },
                          child: Text(
                            'Chỉnh sửa',
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'SFPRODISPLAYBOLD',
                              fontSize: 18,
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 20),
                  child: Text(
                      'Những tiện ích này sẽ xuất hiện ở màn hình chính giúp bạn truy cập nhanh hơn',
                      style: TextStyle(
                        fontFamily: 'SFPRODISPLAYLIGHTITALIC',
                        fontSize: 15,
                      )),
                ),
                Container(
                    child: Obx(
                  () => Wrap(
                    runSpacing: 2,
                    spacing: 40,
                    children: List.generate(features_gim.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  Get.to(features_gim[index].iteamScreen,
                                      transition: Transition.rightToLeft);
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
                      child: Container(
                        child: Text(
                          'Tất cả tiện ích',
                          style: TextStyle(
                            fontFamily: 'SFPRODISPLAYBOLD',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    child: Obx(
                  () => Wrap(
                    runSpacing: 2,
                    spacing: 40,
                    children: List.generate(features.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  Get.to(features[index].iteamScreen,
                                      transition: Transition.rightToLeft);
                                },
                                icon: SvgPicture.asset(
                                    features[index].iteamImages)),
                            Text(
                              features[index].iteamName,
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
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

class EditFeaturePage extends StatelessWidget {
  const EditFeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(children: [
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
              Padding(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tiện ích đã ghim',
                      style: TextStyle(
                        fontFamily: 'SFPRODISPLAYBOLD',
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Xong',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'SFPRODISPLAYBOLD',
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 20),
                child: Text(
                    'Bấm nút (-) để loại tiện ích khỏi truy cập nhanh. Bấm nút (+) để thêm trở lại mục tiện ích nhanh.',
                    style: TextStyle(
                      fontFamily: 'SFPRODISPLAYLIGHTITALIC',
                      fontSize: 15,
                    )),
              ),
              Container(
                  child: Obx(
                () => Wrap(
                  runSpacing: 2,
                  spacing: 40,
                  children: List.generate(features_gim.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(children: [
                        Column(
                          children: [
                            IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (features_gim.elementAt(index) !=
                                      features_empty.elementAt(0)) {
                                    features.add(features_gim.elementAt(index));
                                    features_gim.removeAt(index);
                                    features_gim.insert(
                                        index, features_empty.elementAt(0));
                                  }
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
                        features_gim.elementAt(index) !=
                                features_empty.elementAt(0)
                            ? Positioned(
                                top: 5,
                                left: 35,
                                child: SvgPicture.asset(
                                  'assets/images/subtract.svg',
                                  // width: 22,
                                  // height: 22,
                                ),
                              )
                            : Text("")
                      ]),
                    );
                  }),
                ),
              )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
                    child: Container(
                      child: Text(
                        'Tất cả tiện ích',
                        style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  child: Obx(
                () => Wrap(
                  runSpacing: 2,
                  spacing: 40,
                  children: List.generate(features.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  iconSize: 60,
                                  onPressed: () {
                                    if (features_gim.length == 3 &&
                                        !features_gim.contains(
                                            features_empty.elementAt(0))) {
                                      Get.snackbar('CHÚ Ý',
                                          'Danh sách truy cập nhanh đã đầy, bạn cần loại bớt để có thể thêm các tiện ích nhanh khác',
                                          backgroundColor: Colors.white);
                                    } else {
                                      features_gim.insert(
                                          features_gim.indexOf(
                                              features_empty.elementAt(0)),
                                          features.elementAt(index));
                                      features_gim.remove(features_gim
                                          .elementAt(features_gim.indexOf(
                                              features_empty.elementAt(0))));
                                      features.removeAt(index);
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                      features[index].iteamImages)),
                              Text(
                                features[index].iteamName,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: 5,
                            left: 35,
                            child: SvgPicture.asset(
                              'assets/images/Add.svg',
                              // width: 22,
                              // height: 22,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              )),
            ]),
          ),
        ]),
      ),
    );
  }
}
