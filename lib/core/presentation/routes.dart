import 'package:flutter/material.dart';
import 'package:timezone_locations_app/features/general/presentation/pages/home_page.dart';
import 'package:timezone_locations_app/features/world_timezone/pages/search_page.dart';
import 'package:timezone_locations_app/core/res/utils.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Environments.homeRoute: (_) => HomePage(),
  Environments.searchRoute: (_) => SearchPage(),
};
