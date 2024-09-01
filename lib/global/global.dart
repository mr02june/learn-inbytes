// Flutter imports:
import 'package:flutter/cupertino.dart';

class Global {
  static final List<String> lang = [
    "English",
    "हिंदी",
    "मराठी",
    "ಕನ್ನಡ",
  ];

  static height(context) => MediaQuery.of(context).size.height;
  static width(context) => MediaQuery.of(context).size.width;
  static String apikey = "0dffa068e4d4489b8f1c8643ceedaec5";
}
