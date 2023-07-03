import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/utils.dart';
import 'package:http/http.dart' as http;

import '../Main/navigation_bars.dart';

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackbar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackbar(context, response.body);
  }
}
