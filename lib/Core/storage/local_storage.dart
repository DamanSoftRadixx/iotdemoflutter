import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class Prefs {

  static const String role = "role";
  static const String username = "username";
  static const String password = "password";
  static const String surname = "surname";
  static const String tuyaUid = "tuyaUid";
  static const String tuyaToken = "tuyaToken";
  static const String tuyaRefreshedToken = "tuyaRefreshedToken";
  static const String tuyaTime = "tuyaTokenTime";
  static const String token = "token";
  static const String email = "email";
  static const String signKey = "signKey";
  static const String clientId = "ahx3majss889rgk5n9pq";
  static const String secreateId = "32c3d2e014374a67a3634a0cab616f50";

  static read(String key) {
    var box = GetStorage();
    return box.read(key);
  }

  static write(String key, value) {
    var box = GetStorage();
    box.write(key, value);
  }

  static readObj(String key) {
    var box = GetStorage();
    var data = box.read(key);
    return data != null ? json.decode(data) : null;
  }

  static writeObj(String key, value) {
    var box = GetStorage();
    box.write(key, json.encode(value));
  }

  static erase() {
    var box = GetStorage();
    box.remove(token);
  }

  static storeUserData({required String email, required String accessToken}) {
    Prefs.write(Prefs.email, email);
    Prefs.write(Prefs.token, accessToken);
  }
}
