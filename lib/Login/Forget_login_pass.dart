import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'signin_page.dart';

class ForgetLoginPassPage extends StatefulWidget {
  const ForgetLoginPassPage({super.key});

  @override
  State<ForgetLoginPassPage> createState() => _ForgetLoginPassPageState();
}

class _ForgetLoginPassPageState extends State<ForgetLoginPassPage> {
  @override
  Widget build(BuildContext context) {
    bool _showPassword = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SvgPicture.asset(
                  'assets/images/Background.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Text(
                    '    KIDS\nONLINE',
                    style: TextStyle(
                      fontFamily: 'QueulatUni',
                      color: Color.fromRGBO(15, 51, 123, 1),
                      fontSize: 35,
                    ),
                  ),
                ),
                SvgPicture.asset('assets/images/FrameLock.svg'),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      fontFamily: 'SFPRODISPLAYBOLD',
                      color: Color.fromRGBO(35, 35, 35, 1),
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Text(
                    'Vui lòng nhập mã số HS của bé. Trong trường hợp chính xác, chúng tôi sẽ hiển thị thông tin của giáo viên phụ trách để bạn có thể liên hệ lấy lại mật khẩu đăng nhập!',
                    style: TextStyle(
                      fontFamily: 'SFPRODISPLAYBOLD',
                      color: Color.fromRGBO(35, 35, 35, 1),
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      TextFormField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: SvgPicture.asset('assets/images/Lock.svg'),
                            onPressed: () {},
                          ),
                          hintText: '......',
                          hintStyle: TextStyle(
                              fontFamily: 'SFPRODISPLAYBOLD',
                              color: Color.fromRGBO(60, 60, 67, 0.6)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(224, 224, 224, 1),
                                width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 121, 23, 1),
                                  width: 2)),
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(32),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 121, 23, 1),
                      ),
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Get.to(SignInPage(),
                            transition: Transition.rightToLeft);
                      });
                    },
                    child: Text(
                      ' Đăng nhập      ',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
