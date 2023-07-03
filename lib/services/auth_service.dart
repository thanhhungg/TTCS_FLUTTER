import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/error_headling.dart';
import 'package:flutter_application_2/constants/utils.dart';

import '../Main/navigation_bars.dart';
import '../constants/valiable.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    try {
      User user =
          User(id: '', username: username, password: password, token: '');
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8'
          });
      // ignore: use_build_context_synchronously
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context, "Tạo tài khoản thành công");
          });
    } catch (e) {
      print(e.toString());
    }
  }

  //sign in
  void signInUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'username': username, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8'
          });
      // print(res.body);
      // ignore: use_build_context_synchronously
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationBars()));
          });
    } catch (e) {
      print(e.toString());
    }
  }

  void notificationApi() async {
    try {
      http.Response res = await http.get(Uri.parse('$uri/api/notification'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8'
          });
      print(res.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
