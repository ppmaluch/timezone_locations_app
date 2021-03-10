import 'dart:convert';
import 'package:jiffy/jiffy.dart' as jiffy;
import 'package:flutter/services.dart' show rootBundle;
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';

class TimezoneUtil {
  TimezoneUtil();

  Future<List<String>> loadTimezone() async {
    final response = await rootBundle.loadString('data/timezone_data.json');

    final timezonesList =
        List<String>.from(json.decode(response).map((x) => x));

    return timezonesList;
  }

  static String getTimeStamp(WorldTimezone timezone) {
    var jiffy1 = jiffy.Jiffy(timezone.datetime);
    var jiffy2 = jiffy.Jiffy(DateTime.now().toIso8601String());
    return timezone.datetime == null ? jiffy2.fromNow() : jiffy1.fromNow();
  }
}

final timezoneProvider = new TimezoneUtil();
