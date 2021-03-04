import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/src/providers/providers.dart';
import 'package:timezone_locations_app/src/routes/routes.dart';
import 'package:timezone_locations_app/src/utils/theme_utils.dart';
import 'package:timezone_locations_app/src/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        initialRoute: Environments.homeRoute,
        routes: appRoutes,
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
      ),
    );
  }
}
