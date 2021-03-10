import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';

abstract class IRemote {
  Future<WorldTimezone> getTimezoneInfo(String timezone);
}
