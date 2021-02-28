import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class TimezoneProvider {
  TimezoneProvider();

  Future<List<String>> searchTimezone(String query) async {
    final response = await rootBundle.loadString('data/timezone_data.json');

    final timezonesList =
        (json.decode(response) as List<dynamic>).cast<String>();

    return timezonesList
        .where((element) => element.toLowerCase().contains(query));
  }
}

final timezoneProvider = new TimezoneProvider();
