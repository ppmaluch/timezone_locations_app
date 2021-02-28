import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class TimezoneProvider {
  TimezoneProvider();

  Future<List<String>> loadTimezone() async {
    final response = await rootBundle.loadString('data/timezone_data.json');

    final timezonesList =
        List<String>.from(json.decode(response).map((x) => x));

    return timezonesList;
  }
}

final timezoneProvider = new TimezoneProvider();
