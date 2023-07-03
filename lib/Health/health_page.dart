import 'package:flutter/material.dart';
import 'package:flutter_application_2/Health/bar_chart.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../home_page.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  String? selectedValue = 'Năm 2022';
  final List<String> listItems = <String>[
    "Năm 2016",
    "Năm 2017",
    "Năm 2018",
    "Năm 2022"
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
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButton(
                            color: Colors.deepOrangeAccent,
                          ),
                          Text(
                            "Chỉ số của bé",
                            style: TextStyle(
                                fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                          ),
                        ],
                      ),
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
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: e == selectedValue
                                                ? TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue,
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
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(Iconss.Frame),
                    radius: 30,
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
                ]),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('Đặng Nhật Minh',
                        style: TextStyle(
                            fontFamily: 'SFPRODISPLAYBOLD', fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Ngày sinh: 17/08/2019',
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  height: _h * 1 / 4.5,
                  width: _w * 1 / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.looks,
                        size: 40,
                      ),
                      Text('Chiều cao',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'SFPRODISPLAYBOLD')),
                      Text(
                        '108',
                        style: TextStyle(
                            fontSize: 48, fontFamily: 'SFPRODISPLAYBOLD'),
                      ),
                      Text('cm',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'SFPRODISPLAYBOLD')),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.refresh,
                              size: 12,
                            ),
                            Text('   11:15, 16/08, 2022',
                                style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  height: _h * 1 / 4.5,
                  width: _w * 1 / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.looks,
                        size: 40,
                      ),
                      Text('Cân nặng',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'SFPRODISPLAYBOLD')),
                      Text(
                        '17.70',
                        style: TextStyle(
                            fontSize: 48, fontFamily: 'SFPRODISPLAYBOLD'),
                      ),
                      Text('kg',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'SFPRODISPLAYBOLD')),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.refresh,
                              size: 12,
                            ),
                            Text('   11:15, 16/08, 2022',
                                style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 70),
                // width: _w,
                height: _h * 1 / 3.3,
                child: BarChartSample2()),
            Center(
              child: Text('Biểu đồ theo dõi chỉ số của bé theo tuần'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.file_upload_rounded,
                      color: Colors.grey,
                    ),
                    Text(
                      'Chia sẻ',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Icon(Icons.file_download_rounded, color: Colors.grey),
                    Text(
                      'Lưu về',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
