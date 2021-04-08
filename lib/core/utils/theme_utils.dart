import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: kBackgroundLight,
        canvasColor: kAppBarThemeLigth,
        primaryColor: kPrimaryText,
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: kPrimaryText),
          headline5: TextStyle(color: kPrimaryText),
        ),
        cardColor: kAppBarThemeLigth,
        appBarTheme: AppBarTheme(
          color: kAppBarThemeLigth,
          brightness: Brightness.light,
          textTheme: TextTheme(headline6: TextStyle(color: kPrimaryText)),
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: kBackgroundDark,
        primaryTextTheme: TextTheme(),
        canvasColor: kAppBarThemeDark,
        cardColor: kAppBarThemeDark,
        primaryColor: kSecondaryText,
        brightness: Brightness.dark,
        textTheme: TextTheme(
            bodyText2: TextStyle(color: kSecondaryText),
            headline5: TextStyle(color: kSecondaryText),
            button: TextStyle(color: kSecondaryText)),
        appBarTheme: AppBarTheme(
          color: kAppBarThemeDark,
          brightness: Brightness.dark,
          textTheme: TextTheme(headline6: TextStyle(color: kSecondaryText)),
          iconTheme: IconThemeData(
            color: kSecondaryText,
          ),
        ),
      );

  // Commons themes
  static Color kPrimaryText = Color.fromRGBO(83, 72, 61, 1);
  static Color kSecondaryText = Color.fromRGBO(244, 243, 243, 0.6);
  // light
  static Color kBackgroundLight = Color.fromRGBO(244, 243, 243, 1);
  static Color kAppBarThemeLigth = Colors.white;
  // dark
  static Color kAppBarThemeDark = Color(0xff282828);
  static Color kBackgroundDark = Color(0xff181818);
}

const kDefaultPadding = 20.0;
const kCardAspectRatio = 12.0 / 16.0;
const kWidgetAspectRatio = kCardAspectRatio * 1.2;
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);
