import 'package:http/http.dart' as http;

class TimezoneAPI {
  final String query;
  final String url = 'https://worldtimeapi.org/api/timezone/';

  TimezoneAPI(this.query);

  Future<http.Response> getTimezoneInfo() async {
    return await http.get(Uri.encodeFull(url + query));
  }
}
