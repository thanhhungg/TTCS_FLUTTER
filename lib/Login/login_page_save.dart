import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Forget_login_id.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checked = false;
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: w,
                  height: h,
                  child: SvgPicture.asset(
                    'assets/images/Background.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
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
                    CircleAvatar(
                      minRadius: 30,
                      maxRadius: 60,
                      backgroundImage: AssetImage('assets/images/Frame.jpg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Phụ huynh bé!',
                        style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD',
                          color: Color.fromRGBO(35, 35, 35, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Đặng Nhật Minh',
                        style: TextStyle(
                          fontFamily: 'SFPRODISPLAYBOLD',
                          color: Color.fromRGBO(35, 35, 35, 1),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          TextFormField(
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                icon:
                                    SvgPicture.asset('assets/images/Lock.svg'),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: _checked,
                                onChanged: (value) {
                                  setState(() {
                                    _checked = value!;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                activeColor: Color.fromRGBO(255, 121, 23, 1),
                                checkColor: Colors.white,
                              ),
                              Text(
                                'Lưu mật khẩu?',
                                style: TextStyle(
                                  color: Colors.black,
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
                                              builder: (context) =>
                                                  ForgetLoginIdPage()));
                                    });
                                  },
                                  child: Text(
                                    'Quên mật khẩu?',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
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
                            'Đăng Nhập',
                            style: TextStyle(
                              fontFamily: 'SFPRODISPLAYBOLD',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
