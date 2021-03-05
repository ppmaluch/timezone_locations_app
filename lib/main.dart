import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/core/res/theme_utils.dart';
import 'package:timezone_locations_app/core/res/utils.dart';

import 'core/presentation/notifiers/providers.dart';
import 'core/presentation/routes.dart';

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
