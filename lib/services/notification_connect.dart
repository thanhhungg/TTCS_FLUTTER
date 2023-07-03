import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/model/notification_admin.dart';

import 'package:http/http.dart' as http;

import '../constants/valiable.dart';

List<NotificationAdmin> parseData(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<NotificationAdmin> data =
      list.map((model) => NotificationAdmin.fromJson(model)).toList();
  return data;
}

Future<List<NotificationAdmin>> fetchData() async {
  //chú ý phải để đường dẫn có địa chỉ ip wf
  http.Response res = await http.get(Uri.parse('$uri/api/notification_admin'));
  // debugPrint(res.body.toString());
  if (res.statusCode == 200) {
    return compute(parseData, res.body);
  } else {
    throw Exception('res error');
  }
}
