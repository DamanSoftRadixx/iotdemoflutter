class TokenModel {
  Result? _result;
  bool? _success;
  int? _t;
  String? _tid;

  TokenModel({Result? result, bool? success, int? t, String? tid}) {
    if (result != null) {
      this._result = result;
    }
    if (success != null) {
      this._success = success;
    }
    if (t != null) {
      this._t = t;
    }
    if (tid != null) {
      this._tid = tid;
    }
  }

  Result? get result => _result;
  set result(Result? result) => _result = result;
  bool? get success => _success;
  set success(bool? success) => _success = success;
  int? get t => _t;
  set t(int? t) => _t = t;
  String? get tid => _tid;
  set tid(String? tid) => _tid = tid;

  TokenModel.fromJson(Map<String, dynamic> json) {
    _result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    _success = json['success'];
    _t = json['t'];
    _tid = json['tid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._result != null) {
      data['result'] = this._result!.toJson();
    }
    data['success'] = this._success;
    data['t'] = this._t;
    data['tid'] = this._tid;
    return data;
  }
}

class Result {
  String? _accessToken;
  int? _expireTime;
  String? _refreshToken;
  String? _uid;

  Result(
      {String? accessToken,
        int? expireTime,
        String? refreshToken,
        String? uid}) {
    if (accessToken != null) {
      this._accessToken = accessToken;
    }
    if (expireTime != null) {
      this._expireTime = expireTime;
    }
    if (refreshToken != null) {
      this._refreshToken = refreshToken;
    }
    if (uid != null) {
      this._uid = uid;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  int? get expireTime => _expireTime;
  set expireTime(int? expireTime) => _expireTime = expireTime;
  String? get refreshToken => _refreshToken;
  set refreshToken(String? refreshToken) => _refreshToken = refreshToken;
  String? get uid => _uid;
  set uid(String? uid) => _uid = uid;

  Result.fromJson(Map<String, dynamic> json) {
    _accessToken = json['access_token'];
    _expireTime = json['expire_time'];
    _refreshToken = json['refresh_token'];
    _uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this._accessToken;
    data['expire_time'] = this._expireTime;
    data['refresh_token'] = this._refreshToken;
    data['uid'] = this._uid;
    return data;
  }
}
