import 'package:flutter/material.dart';
import 'package:flutter_application_2/Login/signup_page.dart';
import 'package:flutter_application_2/services/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Iconss.dart';
import '../Main/navigation_bars.dart';
import 'Forget_login_id.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService authService = AuthService();
  bool _checked = false;
  bool _showPassword = false;
  var _passwordController = TextEditingController();
  var _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      username: _nameController.text,
      password: _passwordController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      username: _nameController.text,
      password: _passwordController.text,
    );
  }

  void notificationApi() {
    authService.notificationApi();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: _w,
                height: _h,
                child: SvgPicture.asset(
                  Iconss.Background,
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
                    backgroundImage: AssetImage(Iconss.Frame),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'Xin chào!',
                      style: TextStyle(
                        fontFamily: 'SFPRODISPLAYBOLD',
                        color: Color.fromRGBO(35, 35, 35, 1),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: SvgPicture.asset(Iconss.User),
                          onPressed: () {},
                        ),
                        hintText: 'Mã số HS của bé',
                        hintStyle: TextStyle(
                            fontFamily: 'SFPRODISPLAYBOLD',
                            color: Color.fromRGBO(60, 60, 67, 0.6)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224, 1),
                              width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(255, 121, 23, 1), width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: SvgPicture.asset(Iconss.Lock),
                              onPressed: () {},
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye_rounded),
                            ),
                            hintText: 'Mật khẩu',
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
                                    Get.to(ForgetLoginIdPage(),
                                        transition: Transition.rightToLeft);
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
                      onTap: () {
                        setState(() {
                          Get.to(NavigationBars(),
                              transition: Transition.rightToLeft);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => NavigationBars()));
                          notificationApi();
                          signInUser();
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
                          'Đăng nhập',
                          style: TextStyle(
                            fontFamily: 'SFPRODISPLAYBOLD',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(SignUpPage(),
                            transition: Transition.rightToLeft);
                      },
                      child: Text("ĐĂNG KÍ"))
                ],
              ),
            ],
          ),
        ));
  }
}
