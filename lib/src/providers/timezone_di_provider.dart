import 'package:flutter/material.dart';
import 'package:timezone_locations_app/features/world_timezone/di/DI.dart';
import 'package:timezone_locations_app/features/world_timezone/domain/model/world_timezone_model.dart';

class TimezoneProvider extends ChangeNotifier {
  List<WorldTimezone> timezone = <WorldTimezone>[];
  String errorMessage;
  bool isloading = false;

  Future<bool> fetchTimezone(location) async {
    setLoading(true);

    var worldTimezone = await DI.repository.getTimezoneInfo(location);
    setLoading(false);
    if (worldTimezone.timezone != null) {
      _setTimezone(worldTimezone);
    } else {
      setErrorMessage("Error was found!");
    }

    return _isTimezone();
  }

  void setLoading(value) {
    isloading = value;
    notifyListeners();
  }

  bool isLoading() {
    return isloading;
  }

  void _setTimezone(WorldTimezone value) {
    timezone.add(value);
    notifyListeners();
  }

  void delTimezone(String timezoneName) {
    timezone.removeWhere((element) => element.timezone == timezoneName);
    notifyListeners();
  }

  List<WorldTimezone> getTimezone() {
    return timezone;
  }

  void setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  String getErrorMessage() {
    return errorMessage;
  }

  bool _isTimezone() {
    return timezone != null ? true : false;
  }
}
