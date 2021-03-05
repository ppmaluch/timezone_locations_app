import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: kBackgroudLight,
        canvasColor: kAppBarThemeLigth,
        primaryColor: kPrimaryText,
        cardColor: kAppBarThemeDark,
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
        backgroundColor: kBackgroudDark,
        canvasColor: kAppBarThemeDark,
        cardColor: kAppBarThemeDark,
        primaryColor: kPrimaryText,
        appBarTheme: AppBarTheme(
          color: kAppBarThemeDark,
          brightness: Brightness.light,
          textTheme: TextTheme(headline6: TextStyle(color: Colors.black87)),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      );

  // Cummons themes
  static Color kPrimaryText = Color.fromRGBO(83, 72, 61, 1);
  static Color kSecondaryText = Color.fromRGBO(83, 72, 61, 1);
  // light
  static Color kBackgroudLight = Color.fromRGBO(244, 243, 243, 1);
  static Color kAppBarThemeLigth = Colors.white;
  // dark
  static Color kAppBarThemeDark = Color(0xff282828);
  static Color kBackgroudDark = Color(0xff181818);
}
