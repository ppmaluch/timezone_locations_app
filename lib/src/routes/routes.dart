import 'package:flutter/material.dart';
import 'package:timezone_locations_app/src/pages/home_page.dart';
import 'package:timezone_locations_app/src/pages/search_page.dart';
import 'package:timezone_locations_app/src/utils/utils.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Environments.homeRoute: (_) => HomePage(),
  Environments.searchRoute: (_) => SearchPage(),
};
