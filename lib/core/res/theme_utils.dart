import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: kBackgroundLight,
        canvasColor: kAppBarThemeLigth,
        primaryColor: kPrimaryText,
        cardColor: kAppBarThemeLigth,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          brightness: Brightness.light,
          textTheme: TextTheme(),
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: kBackgroundDark,
        canvasColor: kAppBarThemeDark,
        cardColor: kAppBarThemeDark,
        primaryColor: kPrimaryText,
        appBarTheme: AppBarTheme(
          color: kAppBarThemeDark,
          brightness: Brightness.light,
          textTheme: TextTheme(headline6: TextStyle(color: kPrimaryText)),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      );

  // Commons themes
  static Color kPrimaryText = Color.fromRGBO(83, 72, 61, 1);
  static Color kSecondaryText = Color.fromRGBO(83, 72, 61, 1);
  // light
  static Color kBackgroundLight = Color.fromRGBO(244, 243, 243, 1);
  static Color kAppBarThemeLigth = Colors.white;
  // dark
  static Color kAppBarThemeDark = Color(0xff282828);
  static Color kBackgroundDark = Color(0xff181818);
}
