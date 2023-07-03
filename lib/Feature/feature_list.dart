import 'package:flutter/material.dart';

class FeatureList {
  final String iteamName;
  final String iteamImages;
  final Widget iteamScreen;
  const FeatureList(
      {required this.iteamImages,
      required this.iteamName,
      required this.iteamScreen});

  // static List<String> iteamImages = [
  //   ("assets/images/valentine.svg"),
  //   ("assets/images/medicine.svg"),
  //   ("assets/images/history-calendar.svg"),
  //   ("assets/images/news.svg"),
  //   ("assets/images/picture.svg"),
  //   ("assets/images/money.svg"),
  //   ("assets/images/copied.svg"),
  //   ("assets/images/highlighter.svg"),
  // ];
  // static List<String> iteamName = [
  //   ("Dặn thuốc"),
  //   ("Hoạt động ngày"),
  //   ("Tin tức"),
  //   ("Album ảnh"),
  //   ("Học phí"),
  //   ("Khảo sát"),
  //   ("Nhận xét định kỳ"),
  //   ("Lời nhắn"),
  // ];
}
