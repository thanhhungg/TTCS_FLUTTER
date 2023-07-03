import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/model/action.dart';

import 'package:http/http.dart' as http;

import '../constants/valiable.dart';

List<ActionStudent> parseData(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<ActionStudent> data =
      list.map((model) => ActionStudent.fromJson(model)).toList();
  return data;
}

Future<List<ActionStudent>> fetchData() async {
  //chú ý phải để đường dẫn có địa chỉ ip wf
  http.Response res = await http.get(Uri.parse('$uri/api/notification'));
  // debugPrint(res.body.toString());
  if (res.statusCode == 200) {
    return compute(parseData, res.body);
  } else {
    throw Exception('res error');
  }
}
