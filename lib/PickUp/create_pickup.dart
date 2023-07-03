import 'package:flutter/material.dart';
import 'package:flutter_application_2/Iconss.dart';
import 'package:flutter_svg/svg.dart';

import '../home_page.dart';

class CreatPickUp extends StatefulWidget {
  const CreatPickUp({
    super.key,
    required this.selected,
  });
  final String selected;
  @override
  State<CreatPickUp> createState() => _CreatPickUpState();
}

class _CreatPickUpState extends State<CreatPickUp> {
  final List<Map> listItems = [
    {'id': '1', 'image': "assets/images/Clock.svg", 'name': "Đón đúng giờ"},
    {'id': '2', 'image': "assets/images/Clock-2.svg", 'name': "Đón sớm"},
    {'id': '3', 'image': "assets/images/Clock-3.svg", 'name': "Đón muộn"},
  ];
  late String _selectedValue = widget.selected;
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          BackButton(
                            color: Colors.deepOrangeAccent,
                          ),
                          Text(
                            'Tạo đơn',
                            style: TextStyle(
                                fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 10, right: 10, bottom: 5),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          width: _w,
                          height: 68,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.2, color: Colors.grey),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                              bottom: Radius.circular(16),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    value: _selectedValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedValue = newValue!;
                                      });
                                    },
                                    items: listItems
                                        .map((map) => DropdownMenuItem<String>(
                                            value: map['id'].toString(),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(map['image']),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Tạo đơn'),
                                                    Text(map['name'],
                                                        style: TextStyle(
                                                            fontFamily:
                                                                Font.font,
                                                            color:
                                                                Colors.green))
                                                  ],
                                                ),
                                              ],
                                            )))
                                        .toList(),
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 10, right: 10, bottom: 5),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: _w,
                          height: _h * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                              bottom: Radius.circular(16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFe8e8e8),
                                  blurRadius: 15,
                                  offset: Offset(0, 20))
                            ],
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Ngày đón"),
                                SizedBox(
                                  width: 150,
                                ),
                                Text(
                                  "16 thg 8, 2022",
                                  style: TextStyle(color: Colors.deepOrange),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: _w,
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Giờ đón"),
                                SizedBox(
                                  width: 150,
                                ),
                                Text(
                                  "16 thg 8, 2022",
                                  style: TextStyle(color: Colors.deepOrange),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: _w,
                              height: 0.2,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Row(children: [
                            //   Text('Người đón'),
                            //   Container(
                            //     child: DropdownButtonHideUnderline(child:
                            //     ),
                            //   ),
                            // ],)
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          width: 196,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color.fromRGBO(255, 121, 23, 1)),
                          child: Center(
                              child: Text(
                            'Tạo đơn đón về',
                            style: TextStyle(
                                fontFamily: Font.font,
                                color: Colors.white,
                                fontSize: 16),
                          )),
                        ),
                      ),
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
