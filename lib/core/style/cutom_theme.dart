import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olearistest/core/style/text_style.dart';

/// Custom Theme
class CTheme {
  static getAppTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          titleTextStyle: textStyle.s18.w400.white(context),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      );
}
