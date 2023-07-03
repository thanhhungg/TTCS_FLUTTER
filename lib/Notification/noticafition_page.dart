import 'package:flutter/material.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../services/notification_connect.dart';

class NoticafitionPage extends StatefulWidget {
  const NoticafitionPage({super.key});

  @override
  State<NoticafitionPage> createState() => _NoticafitionPageState();
}

class _NoticafitionPageState extends State<NoticafitionPage> {
  String? selectedValue = 'Mới nhất';
  final List<String> listItems = <String>[
    "Mới nhất",
    "Hôm nay",
    "Tháng này",
    "Tùy chọn khác"
  ];
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
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
                      _mySheet(context);
                    },
                    icon: SvgPicture.asset('assets/images/PhoneCall.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Thông báo",
                        style: TextStyle(
                            fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cài đặt",
                            style:
                                TextStyle(fontFamily: Font.font, fontSize: 18),
                          ))
                    ]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
                child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        double _opacity = 1;
                        Icon _icon = Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        );
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _opacity = 0.5;
                              _icon = Icon(
                                Icons.notifications_off,
                                color: Colors.grey,
                              );
                              _myNotification(context, index);
                            });
                          },
                          child: Opacity(
                            opacity: _opacity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                width: 342,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.4)),
                                child: Row(children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(Iconss.Frame),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 140,
                                            child: Text(
                                              "${snapshot.data?[index].name}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      'SFPRODISPLAYBOLD',
                                                  fontSize: 18),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 70,
                                          ),
                                          Text(
                                            "${snapshot.data?[index].time?.substring(1, 6)}",
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: 250,
                                        child: Text(
                                          "${snapshot.data?[index].title}",
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _icon
                                ]),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("loading data failed");
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey[350]!,
                    highlightColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: 342,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 0.4)),
                        child: Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 140,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 250,
                                height: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              },
            ))
          ]),
        ),
      ]),
    );
  }
}

void _mySheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 350.0,
          child: ListView.builder(
            itemBuilder: (context, index) {},
          ),
        );
      });
}

void _myNotification(BuildContext context, int index) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                    height: 350,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(Iconss.Frame),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Container(
                                    width: 140,
                                    child: Text(
                                      "${snapshot.data?[index].name}",
                                      style: TextStyle(
                                          fontFamily: 'SFPRODISPLAYBOLD',
                                          fontSize: 18),
                                    ),
                                  ),
                                ]),
                                Text(
                                  "Gửi vào ${snapshot.data?[index].time?.substring(1, 6)}, ngày ${snapshot.data?[index].date?.substring(0, 10)}",
                                ),
                              ])
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  "${snapshot.data?[index].title}",
                                  style: TextStyle(
                                      fontFamily: 'SFPRODISPLAYBOLD',
                                      fontSize: 18),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Text(
                                  "${snapshot.data?[index].subtitle}",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
              } else if (snapshot.hasError) {
                return Text("loading data failed");
              }
              return Shimmer.fromColors(
                baseColor: Colors.grey[350]!,
                highlightColor: Colors.white,
                child: SizedBox(
                    height: 350,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Container(
                                    width: 140,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 200,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                ),
                              ])
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 0.2,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Container(
                                width: 140,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              );
            });
      });
}
