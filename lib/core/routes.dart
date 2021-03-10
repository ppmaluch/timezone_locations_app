import 'package:flutter/material.dart';
import 'package:timezone_locations_app/core/pages/home_page.dart';
import 'package:timezone_locations_app/core/utils/utils.dart';
import 'package:timezone_locations_app/features/world_timezone/views/pages/search_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Environments.homeRoute: (_) => HomePage(),
  Environments.searchRoute: (_) => SearchPage(),
};
