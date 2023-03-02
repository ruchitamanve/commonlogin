import '/pushnotifications/models/allnotificationsmodel.dart';
import 'package:get_storage/get_storage.dart';

class storage {
  static String get_device_token() {
    final box = GetStorage();
    return box.read("device_token").toString();
  }

  static set_device_token(String newDeviceToken) {
    final box = GetStorage();
    box.write("device_token", newDeviceToken);
  }

  static String getPassword() {
    final box = GetStorage();
    return box.read("password").toString();
  }

  static setPassword(String pass) {
    final box = GetStorage();
    box.write("password", pass);
  }

  static String get_user_name() {
    final box = GetStorage();
    return box.read("user_name").toString();
  }

  static set_user_name(String newUserName) {
    final box = GetStorage();
    box.write("user_name", newUserName);
  }

  static String get_idr_result_token() {
    final box = GetStorage();
    return box.read("idr_result_token").toString();
  }

  static set_idr_result_token(String idrResultToken) {
    final box = GetStorage();
    box.write("idr_result_token", idrResultToken);
  }

  static String get_party_id_number() {
    final box = GetStorage();
    return box.read("party_id_number").toString();
  }

  static set_party_id_number(String partyidnumber) {
    final box = GetStorage();
    box.write("party_id_number", partyidnumber);
  }

  static String getRoleId() {
    final box = GetStorage();
    return box.read("role_id").toString();
  }

  static setRoleId(String roleId) {
    final box = GetStorage();
    box.write("role_id", roleId);
  }

  static String getStorageKey(String key) {
    final box = GetStorage();
    return box.read(key).toString();
  }

  static setStorgeKeyValue(String key, value) {
    final box = GetStorage();
    box.write(key, value);
  }

  static setUserEmail(String email) {
    final box = GetStorage();
    box.write("user_email", email);
  }

  static getUserEmail() {
    final box = GetStorage();
    return box.read("user_email");
  }

  static setNotifications(AllNotifition notifications) {
    final box = GetStorage();
    box.write("all_notifications", notifications);
  }

  static getNotifications() {
    final box = GetStorage();
    return box.read("all_notifications");
  }
}
