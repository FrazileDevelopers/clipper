import 'package:shared_preferences/shared_preferences.dart';

class UserDataPref {
  static const USERDATA = 'USERS';

  setUserData(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USERDATA, val);
  }

  Future<String> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return !prefs.containsKey(USERDATA) ? '' : prefs.getString(USERDATA);
  }
}
