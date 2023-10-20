import 'dart:convert';
class User {
  User({
      this.email, 
      this.password, 
      this.username, 
      this.surname, 
      this.uid, 
      this.role,this.tuyaToken,this.tuyaRefreshedToken,this.tuyaUid});

  User.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    surname = json['surname'];
    uid = json['uid'];
    role = json['role'];
    role = json['tuyaToken'];
    role = json['tuyaUid'];
    role = json['tuyaRefreshedToken'];
  }
  String? email;
  String? password;
  String? username;
  String? surname;
  String? uid;
  String? role;
  String? tuyaToken;
  String? tuyaUid;
  String? tuyaRefreshedToken;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['username'] = username;
    map['surname'] = surname;
    map['uid'] = uid;
    map['role'] = role;
    map['tuyaToken'] = tuyaToken;
    map['tuyaUid'] = tuyaUid;
    map['tuyaRefreshedToken'] = tuyaRefreshedToken;
    return map;
  }

}