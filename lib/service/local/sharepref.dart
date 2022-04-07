import 'package:shared_preferences/shared_preferences.dart';

class sharepref{
  //save
  void setStringSharedPref (String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // get
  Future<String> getStringSharedPref (String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value.toString();
  }

  // remove
  Future removeSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('removed');
    prefs.clear();
}

}