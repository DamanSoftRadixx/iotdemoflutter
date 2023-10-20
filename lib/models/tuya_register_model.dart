class TuyaRegisterModel {
  Result? _result;
  bool? _success;
  int? _t;
  String? _tid;

  TuyaRegisterModel({Result? result, bool? success, int? t, String? tid}) {
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

  TuyaRegisterModel.fromJson(Map<String, dynamic> json) {
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
  String? _uid;

  Result({String? uid}) {
    if (uid != null) {
      this._uid = uid;
    }
  }

  String? get uid => _uid;
  set uid(String? uid) => _uid = uid;

  Result.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    return data;
  }
}
