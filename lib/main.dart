import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'Core/Firebase/firebase.dart';
import 'Core/storage/local_storage.dart';
import 'Core/theme/app_color_palette.dart';
import 'Core/utils/Routes.dart';

void main() async {
  await GetStorage.init();
  await FirebaseInit().onIint();
  String token = await  Prefs.read(Prefs.tuyaToken)??'';
  runApp( MyApp(token: token,));
}

class MyApp extends StatelessWidget {
  String token ;
   MyApp({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
   var root =  token.isEmpty ? MyRoutes.root : MyRoutes.bottomtabscreen;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: appPages(),
            initialRoute: root,
            theme: ThemeData(primarySwatch: lightColorPalette.primaryBlack),
          );
        });
  }
}
