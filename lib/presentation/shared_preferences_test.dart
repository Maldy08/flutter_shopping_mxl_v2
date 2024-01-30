import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTest {
  Future<bool> getFirstTimeUse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }

  Future<bool> setFirstTimeUse(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isFirstTime', value);
  }
}
