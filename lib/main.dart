import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/core/utils/utils.dart';

import 'core/notifiers/providers.dart';
import 'core/routes.dart';

void main() {
  runApp(EasyDynamicThemeWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        initialRoute: Environments.homeRoute,
        routes: appRoutes,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        themeMode: EasyDynamicTheme.of(context).themeMode,
      ),
    );
  }
}
