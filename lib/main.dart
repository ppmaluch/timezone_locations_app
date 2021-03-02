import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:timezone_locations_app/src/providers/providers.dart';
import 'package:timezone_locations_app/src/routes/routes.dart';
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
        theme: ThemeData(
            fontFamily: 'Roboto',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: Theme.of(context).appBarTheme.copyWith(
                color: Colors.white,
                brightness: Brightness.light,
                textTheme: TextTheme(headline6: TextStyle(color: Colors.black87)),
                iconTheme: IconThemeData(color: Colors.black87))),
      ),
    );
  }
}
