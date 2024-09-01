// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:inshort_clone/style/colors.dart';

final ThemeData kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff222222),
  primaryColor: AppColor.accent,
  hintColor: AppColor.accent,
  appBarTheme: AppBarTheme(
    color: Color(0xff333333),
    iconTheme: IconThemeData(
      color: AppColor.accent,
    ), systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  iconTheme: IconThemeData(
    color: AppColor.accent,
  ),
  fontFamily: "Montserrat",
);

final ThemeData kLightThemeData = ThemeData(
  canvasColor: AppColor.background,
  hintColor: AppColor.accent,
  cardColor: AppColor.error,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  iconTheme: IconThemeData(
    color: AppColor.accent,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: AppColor.accent,
    ), systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  fontFamily: "Montserrat", textSelectionTheme: TextSelectionThemeData(cursorColor: AppColor.primaryVariant),
);
