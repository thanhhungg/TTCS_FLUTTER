import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/PickUp/create_pickup.dart';
import 'package:flutter_application_2/PickUp/data_pickup.dart';
import 'package:flutter_application_2/PickUp/parents_pickup.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_manager/photo_manager.dart';

import '../Iconss.dart';
import '../home_page.dart';
import 'avatar_image.dart';

DateTime currentTime = DateTime.now();

class PickUpPage extends StatefulWidget {
  const PickUpPage({super.key});

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    var status = true;
    final List<String> listItems = <String>[
      "Trước 1 tiếng",
      "Trước 30 phút",
      "Trước 15 phút",
    ];
    String? selectedValue = 'Trước 1 tiếng';
    return Scaffold(
      body: Column(
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
                            icon:
                                SvgPicture.asset('assets/images/PhoneCall.svg'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              BackButton(
                                color: Colors.deepOrangeAccent,
                              ),
                              Text(
                                'Đón về',
                                style: TextStyle(
                                    fontFamily: 'SFPRODISPLAYBOLD',
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                _editBottom(
                                    context, status, selectedValue, listItems);
                              },
                              child: Text(
                                'Cài đặt nhắc nhở',
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(250, 238, 224, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const TabBar(
                                    indicator: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    tabs: [
                                      Tab(
                                        text: 'Đơn đón',
                                      ),
                                      Tab(text: 'Người đưa đón'),
                                      Tab(text: 'Lịch sử')
                                    ]),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: _w,
                                height: _h * 0.7,
                                // color: Colors.green,
                                child: TabBarView(children: [
                                  Form(),
                                  ShuttlePerson(),
                                  History(),
                                ]),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> _editBottom(BuildContext context, bool status,
      String selectedValue, List<String> listItems) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
              height: 170,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cài đặt ngày nhắc về",
                        style: TextStyle(fontFamily: Font.font, fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nhắc nhở đón về hàng ngày',
                            style:
                                TextStyle(fontSize: 15, fontFamily: Font.font)),
                        SizedBox(
                          width: 90,
                        ),
                        FlutterSwitch(
                          width: 60.0,
                          height: 30.0,
                          inactiveColor: Color.fromRGBO(224, 224, 224, 1),
                          activeColor: Colors.deepOrange,
                          toggleSize: 20.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 4.0,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Opacity(
                  opacity: status ? 1 : 0.5,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Thời gian nhắc nhở                     ",
                          style: TextStyle(fontFamily: Font.font, fontSize: 15),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.2,
                                  color: Colors.grey,
                                  style: BorderStyle.solid)),
                          child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    items: listItems
                                        .map((e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: e == selectedValue
                                                  ? TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blue,
                                                      fontFamily: Font.font)
                                                  : TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: Font.font),
                                            )))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                      });
                                    },
                                  ))),
                        ),
                      ],
                    ),
                  ),
                )
              ]));
        });
  }
}

class History extends StatefulWidget {
  const History({
    super.key,
  });

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 0.2, color: Colors.grey),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentTime = DateTime(
                          currentTime.year,
                          currentTime.month > 12 ? 1 : currentTime.month,
                          currentTime.day -
                              DateTime(
                                      currentTime.year,
                                      currentTime.month > 12
                                          ? 1
                                          : currentTime.month,
                                      0)
                                  .day);
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  iconSize: 20,
                ),
                Container(
                  height: 34,
                  width: MediaQuery.of(context).size.width * 1 / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Center(
                      child: Text(
                          'Tháng ${currentTime.month}, ${currentTime.year}',
                          style:
                              TextStyle(fontFamily: Font.font, fontSize: 15))),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentTime = DateTime(
                          currentTime.year,
                          currentTime.month > 12 ? 1 : currentTime.month,
                          currentTime.day +
                              DateTime(
                                      currentTime.year,
                                      currentTime.month > 12
                                          ? 1
                                          : currentTime.month,
                                      0)
                                  .day);
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  iconSize: 20,
                ),
              ],
            ),
            Container(
              height: 0.2,
              color: Colors.grey,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: dataPickup.length,
                  itemBuilder: (context, index) {
                    if (currentTime.month == dataPickup[index].day.month) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat.yMd()
                                          .format(dataPickup[index].day)
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: Font.font, fontSize: 18),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${dataPickup[index].name}',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontFamily: Font.font,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          dataPickup[index].status,
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontFamily: Font.font,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            'Đã tạo lúc: 16:12, ${DateFormat.yMd().format(DateTime.now()).toString()}')
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 0.2,
                            color: Colors.grey,
                          )
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}

class ShuttlePerson extends StatelessWidget {
  const ShuttlePerson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_circle_rounded,
          size: 35,
        ),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: dataPickup.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 0.2, color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Row(
                              children: [
                                selectedAvatar.length >= 0 &&
                                        selectedAvatar.length > index
                                    ? AssetEntityImage(
                                        selectedAvatar[index],
                                        width: 45,
                                        height: 45,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/images/Frame.jpg",
                                        width: 45,
                                        height: 45,
                                        fit: BoxFit.cover,
                                      ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 240,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dataPickup[index].name_parents,
                                    style: TextStyle(
                                        fontFamily: Font.font, fontSize: 20)),
                                Opacity(
                                    opacity: 0.5,
                                    child: Text(dataPickup[index].name))
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(
                              ParentsPickUp(
                                id: dataPickup[index].id,
                              ),
                              transition: Transition.rightToLeft);
                        },
                        icon: Icon(Icons.arrow_forward_ios_outlined),
                        iconSize: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}

class Form extends StatefulWidget {
  const Form({
    super.key,
  });

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 107,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromRGBO(229, 252, 221, 1),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(
                            CreatPickUp(
                              selected: '1',
                            ),
                            transition: Transition.fade);
                      },
                      child: Container(
                          width: 45,
                          height: 45,
                          child: SvgPicture.asset("assets/images/Clock.svg")),
                    ),
                    Text('Tạo đơn', style: TextStyle()),
                    Text(
                      'Đón đúng giờ',
                      style: TextStyle(color: Color.fromRGBO(39, 174, 96, 1)),
                    )
                  ],
                )),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(
                    CreatPickUp(
                      selected: '2',
                    ),
                    transition: Transition.fade);
              },
              child: Container(
                  width: 107,
                  height: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(253, 245, 217, 1),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                          width: 45,
                          height: 45,
                          child: SvgPicture.asset("assets/images/Clock-2.svg")),
                      Text('Tạo đơn', style: TextStyle()),
                      Text(
                        'Đón sớm',
                        style:
                            TextStyle(color: Color.fromRGBO(255, 121, 23, 1)),
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(
                    CreatPickUp(
                      selected: '3',
                    ),
                    transition: Transition.fade);
              },
              child: Container(
                  width: 107,
                  height: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromRGBO(255, 237, 236, 1),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                          width: 45,
                          height: 45,
                          child: SvgPicture.asset("assets/images/Clock-3.svg")),
                      Text('Tạo đơn', style: TextStyle()),
                      Text(
                        'Đón muộn',
                        style: TextStyle(color: Color.fromRGBO(235, 87, 87, 1)),
                      )
                    ],
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 0.2, color: Colors.grey),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentTime = DateTime(
                            currentTime.year,
                            currentTime.month > 12 ? 1 : currentTime.month,
                            currentTime.day -
                                DateTime(
                                        currentTime.year,
                                        currentTime.month > 12
                                            ? 1
                                            : currentTime.month,
                                        0)
                                    .day);
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    iconSize: 20,
                  ),
                  Container(
                    height: 34,
                    width: MediaQuery.of(context).size.width * 1 / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Center(
                        child: Text(
                            'Tháng ${currentTime.month}, ${currentTime.year}',
                            style: TextStyle(
                                fontFamily: Font.font, fontSize: 15))),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentTime = DateTime(
                            currentTime.year,
                            currentTime.month > 12 ? 1 : currentTime.month,
                            currentTime.day +
                                DateTime(
                                        currentTime.year,
                                        currentTime.month > 12
                                            ? 1
                                            : currentTime.month,
                                        0)
                                    .day);
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    iconSize: 20,
                  ),
                ],
              ),
              Container(
                height: 0.2,
                color: Colors.grey,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: dataPickup.length,
                    itemBuilder: (context, index) {
                      if (currentTime.month == dataPickup[index].day.month) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat.yMd()
                                            .format(dataPickup[index].day)
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: Font.font,
                                            fontSize: 18),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${dataPickup[index].name}',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily: Font.font,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            dataPickup[index].status,
                                            style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontFamily: Font.font,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              'Đã tạo lúc: 16:12, ${DateFormat.yMd().format(DateTime.now()).toString()}')
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 0.2,
                              color: Colors.grey,
                            )
                          ],
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: InkWell(
            onTap: () {
              showDialog(context: context, builder: (context) => Dialog());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.deepOrange[100],
              ),
              height: 30,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.notifications_active,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Sắp đến giờ đón bé hôm nay'),
                SizedBox(
                  width: 10,
                ),
                Text('${DateTime.now().hour}:${DateTime.now().minute}',
                    style: TextStyle(fontFamily: Font.font)),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 140, left: 20, right: 20, bottom: 150),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${DateTime.now().hour}:${DateTime.now().minute}',
                style: TextStyle(fontFamily: Font.font, fontSize: 20),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cài đặt',
                    style: TextStyle(fontFamily: Font.font, fontSize: 20),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset("assets/images/notification_color.svg"),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'Sắp đến giờ đón bé hôm nay!',
            style: TextStyle(fontFamily: Font.font, fontSize: 20),
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            '${DateTime.now().hour}:${DateTime.now().minute}',
            style: TextStyle(
                fontFamily: Font.font,
                fontSize: 50,
                color: Color.fromRGBO(255, 121, 23, 1)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 14),
            width: 196,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromRGBO(255, 121, 23, 1)),
            child: Center(
                child: Text(
              'Báo lại sau 15 phút',
              style: TextStyle(
                  fontFamily: Font.font, color: Colors.white, fontSize: 16),
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Tắt hôm nay',
            style: TextStyle(
                color: Colors.blue, fontFamily: Font.font, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel,
                size: 50,
              ))
        ]),
      ),
    );
  }
}
