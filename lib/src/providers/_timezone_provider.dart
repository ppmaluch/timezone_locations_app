import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:timezone_locations_app/src/model/timezone_model.dart';
import 'package:timezone_locations_app/src/requests/timezone_request.dart';
import 'dart:convert';

class TimezoneProviderOLD extends ChangeNotifier {
  List<Timezone> timezone = new List<Timezone>();
  String errorMessage;
  bool isloading = false;

  Future<bool> fetchTimezone(location) async {
    setLoading(true);

    Response response = await TimezoneAPI(location).getTimezoneInfo();
    setLoading(false);
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      _setTimezone(Timezone.fromJson(decode));
    } else {
      Map<String, dynamic> result = json.decode(response.body);
      setErrorMessage(result['message']);
    }

    return _isTransaction();
  }

  void setLoading(value) {
    isloading = value;
    notifyListeners();
  }

  bool isLoading() {
    return isloading;
  }

  void _setTimezone(Timezone value) {
    timezone.add(value);
    notifyListeners();
  }

  void delTimezone(String timezoneName) {
    timezone.removeWhere((element) => element.timezone == timezoneName);
    notifyListeners();
  }

  List<Timezone> getTimezone() {
    return timezone;
  }

  void setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  String getErrorMessage() {
    return errorMessage;
  }

  bool _isTransaction() {
    return timezone != null ? true : false;
  }
}
