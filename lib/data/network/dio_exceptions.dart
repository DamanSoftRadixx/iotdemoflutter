import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';


class DioExceptions implements Exception {
  DioExceptions.fromDioError({required dio.DioException dioError}) {

    var statusCode = dioError.response?.statusCode ?? 0;
    log("DioException ${dioError.type} and sttus $statusCode}");
    switch (dioError.type) {

      case dio.DioExceptionType.cancel:
        break;
      case dio.DioExceptionType.connectionTimeout:
        apiErrorDialog(
          message: 'AppStrings.connectionTimeOut.tr',
          okButtonPressed: () {
            Get.back(
            );
          },);
        break;
      case dio.DioExceptionType.receiveTimeout:
        apiErrorDialog(
          message: 'AppStrings.connectionTimeOut.tr',
          okButtonPressed: () {
            Get.back(
            );
          },
        );
        break;
      case dio.DioExceptionType.connectionError:
        apiErrorDialog(
          message: 'AppStrings.connectionTimeOut.tr',
          okButtonPressed: () {
            Get.back(
            );
          },
        );
        break;

      case dio.DioExceptionType.badResponse:
        dio.Response? response = dioError.response;

        var data = response?.data;

        var statusCode = response?.statusCode ?? 0;
        log("messagefgdgdfgdfgdf $statusCode");

        var statusMessage =
            response?.statusMessage ?? 'AppStrings.strSometingWentWrong.tr';
        if (statusCode == 413) {
          apiErrorDialog(
            message: statusMessage,
            okButtonPressed: () {
              Get.back(
              );
            },
          );
        } else if (statusCode == 401) {
          apiErrorDialog(
            message: statusMessage,
            okButtonPressed: () {
              Get.back();
              // CommonFunctionality().clearPrefAndLogout();
            },
          );
        } else if (statusCode == 500) {
          apiErrorDialog(
            message: 'AppStrings.strSometingWentWrong.tr',
            okButtonPressed: () {
              Get.back(
              );
            },
          );
        } else {
          var message = data["message"];
          var status = data["status"] ?? 0;
          if (status == 401) {
            // CommonFunctionality().clearPrefAndLogout();
          } else {
            apiErrorDialog(
              message: message ?? 'AppStrings.strSometingWentWrong.tr',
              okButtonPressed: () {
                Get.back(
                );
              },
            );
          }
        }
        break;

      case dio.DioExceptionType.sendTimeout:
        apiErrorDialog(
          message: 'AppStrings.connectionTimeOut.tr',
          okButtonPressed: () {
            Get.back(
            );
          },
        );
        break;
      case dio.DioExceptionType.unknown:
        apiErrorDialog(
          message: 'AppStrings.strSometingWentWrong.tr',
          okButtonPressed: () {
            Get.back(
            );
          },
        );
        break;

      default:
        apiErrorDialog(
          message: 'AppStrings.strSometingWentWrong.tr',
          okButtonPressed: () {
            Get.back(
            );
          },
        );
        break;
    }
  }
}

apiErrorDialog(
    {String? title, required String message, Function()? okButtonPressed}) {
  apiErrorDialog(
    message: 'AppStrings.strError.tr',
    okButtonPressed: () {
      Get.back(
      );
    },
  );
  // apiErrorDialog(
  //     title: title ?? AppStrings.strError.tr,
  //     subHeader: message,
  //     okPressed: () {
  //       (okButtonPressed != null) ? okButtonPressed() : Get.back();
  //     },
  //     buttonTitle: 'Ok',maxlins: 10);
}
