import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkCheck {
  Future<bool> isInternetAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print("connectivityResult : $connectivityResult");
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  noInternetConnectionDialog() {
    // showCommonAlertSingleButtonDialog(
    //     title: AppStrings.strNoInternetConnection,
    //     subHeader:AppStrings.strPleaseCheckYourInternetConnectivity,
    //     okPressed: () {
    //       Get.back();
    //     }, buttonTitle: AppStrings.ok.tr);
  }

  Future<bool> hasNetwork() async {
    try {
      List<InternetAddress> result = await InternetAddress.lookup('google.com');
      // log("Internet connection Status : $result");

      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      log("Internet connection Error: $e");
      return false;
    }
  }

}
