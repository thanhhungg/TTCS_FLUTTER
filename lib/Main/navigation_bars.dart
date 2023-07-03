
import 'package:flutter/material.dart';
import '../Feature/feature_page.dart';
import '../home_page.dart';
import '../Notification/noticafition_page.dart';
import '../user_page.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});

  @override
  State<NavigationBars> createState() => _NavigaterBarsState();
}

class _NavigaterBarsState extends State<NavigationBars> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    FeaturePage(),
    NoticafitionPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Color.fromRGBO(255, 121, 23, 1),
          // unselectedItemColor: Color.fromRGBO(196, 196, 196, 1),
          // backgroundColor: Colors.deepOrangeAccent,
          fixedColor: Color.fromRGBO(255, 121, 23, 1),
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rate_rounded),
              label: 'Tính năng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
