import 'dart:convert';

import 'package:http/http.dart';
import 'package:timezone_locations_app/features/world_timezone/data/datasource/remote/Remote.dart';
import 'package:timezone_locations_app/features/world_timezone/data/model/world_timezone_model.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';

class HttpRemote extends IRemote {
  static final String _endPoint = 'https://worldtimeapi.org/api/timezone/';
  @override
  Future<WorldTimezone> getTimezoneInfo(String timezone) async {
    WorldTimezoneModel worldTimezone;
    var response = await get(
      Uri.encodeFull(_endPoint + timezone),
    );
    if (response.statusCode == 200) {
      worldTimezone = WorldTimezoneModel.fromJson(
        jsonDecode(response.body),
      );
      return worldTimezone.toModel();
    } else {
      return worldTimezone.toModel();
    }
  }
}
