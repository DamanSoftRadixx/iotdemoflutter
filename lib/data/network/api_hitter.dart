import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import '../../Core/storage/local_storage.dart';
import 'apiendpoint.dart';
import 'dio_exceptions.dart';
import 'network_check.dart';


class ApiHitter {
  static Dio dio = Dio();
  static CancelToken cancelToken = CancelToken();
  final GlobalKey key = GlobalKey();
  NetworkCheck networkCheck = NetworkCheck();
  final cancelTokenStatusCode = "10000";
  final Duration duration=const Duration(seconds: 10);
  postApi(
      {required String endPoint,
        Object? body,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
        bool isCancelToken = false,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headersParm}) async {
    try {
      String url = "${ApiEndPoint.TUYA_BASE_URL}$endPoint";
      if (await networkCheck.hasNetwork()) {
        if (isCancelToken) {
          cancelToken.cancel();

          if (cancelToken.isCancelled) {
            cancelToken = CancelToken();
          }
        }
        String token = await Prefs.read(Prefs.tuyaToken) ?? "";
        String signKey = await Prefs.read(Prefs.signKey) ?? "";
        var time = await Prefs.read(Prefs.tuyaTime)??DateTime.now().microsecondsSinceEpoch.toString();
        // var time = DateTime.now().microsecondsSinceEpoch.toString();
        Map<String, String> headers = {
          'Content-Type': 'application/json',
          "client_id":Prefs.clientId,
          "access_token":token,
          "sign":signKey,
          "t":time,
          "sign_method":"HMAC-SHA256"
        };
        log("headers>> $headers amd urd $url");
        headers.addAll(headersParm ?? {});
        Options options = Options(headers: headers);

        var response = await dio.post(
          url,
          options: options,
          data: body,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          cancelToken: cancelToken,
          queryParameters: queryParameters,
        ).timeout(duration);
        print('reponse code $headers and response $response');
        var statusCode = response.data["status"] ?? 400;
        var statusMessage = response.data["message"] ?? '';
        print('reponse code $statusCode');
        print('statusMessage code $statusMessage');
        if (statusCode == 201 || statusCode == 200) {
          return response;
        } else {
          apiErrorDialog(
            message: statusMessage ?? "",
            okButtonPressed: () {
              Get.back();
            },
          );
        }
        log("response>>>>>> $response");
      } else {
        log("no internet issue");
        networkCheck.noInternetConnectionDialog();
      }
    } catch (e) {
      print('error of regist user is $e');
      if (e is DioException) {
        if(e.type == DioExceptionType.cancel){
          return Response(data: {
            "status" : cancelTokenStatusCode,
          }, requestOptions: RequestOptions());
        }
        throw DioExceptions.fromDioError(dioError: e);
      } else {
        throw Exception("Error");
      }
    }
  }

  putApi(
      {required String endPoint,
        Object? body,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
        bool isCancelToken = false,
        Map<String, dynamic>? queryParameters}) async {
    try {
      String url = "${ApiEndPoint.BASE_URL}$endPoint";
      print("URL $endPoint >> $url");
      print("PUT $endPoint >> $body");
      if (await networkCheck.hasNetwork()) {
        String token = await Prefs.read(Prefs.token) ?? "";
        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'authorization': "Bearer $token",
        };
        print("headers : $headers");
        print("token : $token");
        Options options = Options(headers: headers);
        var response = await dio.put(
          url,
          options: options,
          data: body,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          cancelToken: cancelToken,
          queryParameters: queryParameters,
        ).timeout(duration);
        return response;
      } else {
        log("no internet issue");
        networkCheck.noInternetConnectionDialog();
      }
    } catch (e) {
      if (e is DioException) {
        if(e.type == DioExceptionType.cancel){
          return Response(data: {
            "status" : cancelTokenStatusCode,
          }, requestOptions: RequestOptions());
        }
        throw DioExceptions.fromDioError(dioError: e);
      } else {
        throw Exception("Error");
      }
    }
  }
  getApi(
      {required String endPoint,
        Object? body,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
        bool isCancelToken = false,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headersParm}) async {
    try {
      String url = "${ApiEndPoint.BASE_URL}$endPoint";
      if (await networkCheck.hasNetwork()) {
        if (isCancelToken) {
          cancelToken.cancel();

          if (cancelToken.isCancelled) {
            cancelToken = CancelToken();
          }
        }
        String token = await Prefs.read(Prefs.token) ?? "";
        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'authorization': "Bearer $token",
        };
        Options options = Options(headers: headersParm ?? headers);
        print("headers : $headers");
        Response response = await dio.get(
          url,
          options: options,
          data: body,
          onReceiveProgress: onReceiveProgress,
          cancelToken: cancelToken,
          queryParameters: queryParameters,
        ).timeout(duration);
        return response;
      } else {
        log("no internet issue");
        networkCheck.noInternetConnectionDialog();
      }
    } catch (e) {
      if (e is DioException) {

        if(e.type == DioExceptionType.cancel){
          return Response(data: {
            "status" : cancelTokenStatusCode,
          }, requestOptions: RequestOptions());
        }
        throw DioExceptions.fromDioError(dioError: e);
      } else {
        throw Exception("Error");
      }
    }
  }
  getTuyaToken(
      {required String endPoint,
        Object? body,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
        bool isCancelToken = false,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headersParm}) async {
    try {
      String url = "${ApiEndPoint.TUYA_BASE_URL}$endPoint";
      if (await networkCheck.hasNetwork()) {
        if (isCancelToken) {
          cancelToken.cancel();
          if (cancelToken.isCancelled) {
            cancelToken = CancelToken();
          }
        }
        Map<String, String> headers = Map();
        String t = DateTime.now().millisecondsSinceEpoch.toString();
        headers['client_id'] = Prefs.clientId;
        headers['t'] = t;
        headers['sign_method'] = 'HMAC-SHA256';
        headers['sign'] = gernateSignKey(t);
        Options options = Options(headers: headersParm ?? headers);
        Response response = await dio.get(
          url,
          options: options,
          data: body,
          onReceiveProgress: onReceiveProgress,
          cancelToken: cancelToken,
          queryParameters: queryParameters,
        ).timeout(duration);
        await Prefs.write(Prefs.signKey, headers['sign']);
        return response;
      } else {
        log("no internet issue");
        networkCheck.noInternetConnectionDialog();
      }
    } catch (e) {
      if (e is DioException) {

        if(e.type == DioExceptionType.cancel){
          return Response(data: {
            "status" : cancelTokenStatusCode,
          }, requestOptions: RequestOptions());
        }
        throw DioExceptions.fromDioError(dioError: e);
      } else {
        throw Exception("Error");
      }
    }
  }


  static  String gernateSignKey(String time){
    var str='${Prefs.clientId}${time}GET\ne3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855\n\n/v1.0/token?grant_type=1';
    String signKey=calculateHMACSHA256(str,Prefs.secreateId).toUpperCase();
    return signKey;
  }
  static String calculateHMACSHA256(String input, String secret) {
    final key = utf8.encode(secret);
    final bytes = utf8.encode(input);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return digest.toString();
  }

  multiPart(
      {required String endPoint,
        Object? body,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
        CancelToken? cancelToken,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headersParm}) async {
    try {
      String url = "${ApiEndPoint.BASE_URL}$endPoint";
      print("URL $endPoint >> $url");

      if (await networkCheck.hasNetwork()) {
        String token = await Prefs.read(Prefs.token) ?? "";
        Map<String, String> headers = {
          'accept': 'application/json',
          'Content-Type': 'multipart/form-data',
          'authorization': "Bearer $token",
        };

        headers.addAll(headersParm ?? {});

        Options options = Options(headers: headers);

        var response = await dio.post(
          url,
          options: options,
          data: body,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          cancelToken: cancelToken,
          queryParameters: queryParameters,
        ).timeout(duration);
        return response;
      } else {
        log("no internet issue");
        networkCheck.noInternetConnectionDialog();
      }
    } catch (e) {
      print("eeeeee$e");
      if (e is DioException) {
        if(e.type == DioExceptionType.cancel){
          return Response(data: {
            "status" : cancelTokenStatusCode,
          }, requestOptions: RequestOptions());
        }
        throw DioExceptions.fromDioError(dioError: e);
      } else {
        throw Exception("Error");
      }
    }
  }

  getGoogleAddressApi(
      {required String endPoint,
        Object? body,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
        CancelToken? cancelToken,
        Map<String, dynamic>? queryParameters,
        Map<String, String>? headersParm}) async {
    try {
      String url = endPoint;

      if (await networkCheck.hasNetwork()) {
        Response response = await dio.get(
          url,
        );
        return response;
      } else {
        log("no internet issue");
        networkCheck.noInternetConnectionDialog();
      }
    } catch (e) {
      if (e is DioException) {
        if(e.type == DioExceptionType.cancel){
          return Response(data: {
            "status" : cancelTokenStatusCode,
          }, requestOptions: RequestOptions());
        }
        throw DioExceptions.fromDioError(dioError: e);
      } else {
        throw Exception("Error");
      }
    }
  }


  Future<bool> cancelRequests() async {
    cancelToken.cancel();
    return cancelToken.isCancelled;
  }
}
