import '/client_id/common_url_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences {
  static getBoolValue(key) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    return sharedPref.getBool(key);
  }

  static setBoolValue(key, value) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.setBool(key, value);
  }

  static setStringValue(key, value) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.setString(key, value.toString());
  }

  static getStringValue(key) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    return sharedPref.getString(key) ?? '';
  }

  static setCommonUrlDataValue(key, value) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.setString(key, value);
  }

  static getCommonUrlDataValue(key) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    return sharedPref.getString(key) ?? '';
  }
}
