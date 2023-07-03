import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Forget_login_pass.dart';
import 'signin_page.dart';

class ForgetLoginIdPage extends StatefulWidget {
  const ForgetLoginIdPage({super.key});

  @override
  State<ForgetLoginIdPage> createState() => _ForgetLoginIdPageState();
}

class _ForgetLoginIdPageState extends State<ForgetLoginIdPage> {
  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: SvgPicture.asset('assets/images/User.svg'),
                        onPressed: () {},
                      ),
                      hintText: 'Mã số HS của bé',
                      hintStyle: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD',
                          color: Color.fromRGBO(60, 60, 67, 0.6)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(224, 224, 224, 1), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 121, 23, 1), width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Get.to(ForgetLoginPassPage(),
                            transition: Transition.rightToLeft);
                      });
                    },
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      });
                    },
                    child: Text(
                      'Đăng nhập      ',
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
