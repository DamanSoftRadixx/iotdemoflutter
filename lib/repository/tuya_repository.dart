import 'dart:developer';
import 'package:flutter/foundation.dart';

import '../Core/common_ui/snackbar/snackbar.dart';
import '../data/network/api_hitter.dart';
import '../data/network/apiendpoint.dart';
import '../models/token_model.dart';
import '../models/tuya_register_model.dart';

class TuyaRepository{
  ApiHitter apiHitter = ApiHitter();

  Future<TokenModel> getToken({required Map<String,dynamic> parameter})async{
    var response = await apiHitter.getTuyaToken(
        endPoint: ApiEndPoint.getToken,
        queryParameters: parameter
    );
    try {
      if (kDebugMode) {
        print('response :${response}');
      }
      if (response.data["success"] == false) {
        snackbar(response.data["msg"]);
      }
    }catch(e){
      if (kDebugMode) {
        print('Some thing $e');
      }
      snackbar("SomeThing Error");
    }
    return TokenModel.fromJson(response.data);
  }

  Future<TuyaRegisterModel> registerUser({required Map<String,dynamic> body})async{
    var response = await apiHitter.postApi(
        endPoint: ApiEndPoint.registerTuyaUser,
        body: body
    );
    // return TuyaRegisterModel.fromJson(response.data);
    return TuyaRegisterModel.fromJson({});
  }



}