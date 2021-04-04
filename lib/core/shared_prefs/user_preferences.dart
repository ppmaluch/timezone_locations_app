import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }
  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get gridMode {
    return _prefs.getBool('gridMode') ?? false;
  }

  set gridMode(bool value) {
    _prefs.setBool('gridMode', value);
  }
}
