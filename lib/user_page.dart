import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Iconss.dart';
import 'home_page.dart';

int _currentIndex = 0;

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
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
                        icon: SvgPicture.asset('assets/images/PhoneCall.svg'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DefaultTabController(
                      length: 2,
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
                                labelPadding: EdgeInsets.all(10),
                                tabs: [
                                  Tab(
                                    text: 'Thông tin của bé',
                                  ),
                                  Tab(text: 'Thông tin phụ huynh'),
                                ]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: _w,
                            height: _h * 0.62,
                            // color: Colors.green,
                            child: TabBarView(children: [
                              _UserSonPage(),
                              _UserParentPage(),
                            ]),
                          ),
                        ],
                      )),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserSonPage extends StatelessWidget {
  const _UserSonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CircleAvatar(
              minRadius: 30,
              maxRadius: 60,
              backgroundImage: AssetImage(Iconss.Frame),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              'ĐẶNG NHẬT MINH',
              style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD', fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.date_range_outlined),
                    title: Text('Ngày sinh'),
                    trailing: Text('17/08/2019',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('Biệt danh'),
                    trailing: Text('Min',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.male),
                    title: Text('Giới tính'),
                    trailing: Text('Nữ',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.account_balance_outlined),
                    title: Text('Trường'),
                    trailing: Text('Trường Mầm non Họa Mi',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Lớp'),
                    trailing: Text('Mầm non A3',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserParentPage extends StatelessWidget {
  const _UserParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Họ tên'),
                    trailing: Text('Trương Ngọc Diệp',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.calendar_month_outlined),
                    title: Text('Ngày sinh'),
                    trailing: Text('17/08/2019',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Địa chỉ'),
                    trailing: Text('Số 17 Láng Hạ, Đống Đa, Hà Nội',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('Email'),
                    trailing: Text('trangnhungoc@gmail.com',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.call),
                    title: Text('Điện thoại'),
                    trailing: Text('0973 222 222',
                        style: TextStyle(fontFamily: 'SFPRODISPLAYBOLD')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
