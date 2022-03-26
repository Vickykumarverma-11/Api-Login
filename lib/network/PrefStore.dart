
import 'package:shared_preferences/shared_preferences.dart';


class PrefStore {
  static String TOKEN = "LOGIN_TOKEN";

}



saveToken(String key, String? value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value == null ? "" : value);
}

Future<String?> getToken(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) == null ? ("") : prefs.getString(key);
}
