import 'package:iotdemoflutter/features/bottom_tabs/binding/bottom_tab_binding.dart';
import 'package:iotdemoflutter/features/bottom_tabs/screen/bottom_tab_screen.dart';
import 'package:iotdemoflutter/features/change_password/binding/change_password_binding.dart';
import 'package:iotdemoflutter/features/change_password/controller/change_password_controller.dart';
import 'package:iotdemoflutter/features/change_password/screen/change_password_screen.dart';
import 'package:iotdemoflutter/features/dashboard/binding/dashboard_binding.dart';
import 'package:iotdemoflutter/features/dashboard/screen/dashboard_screen.dart';
import 'package:iotdemoflutter/features/profile/binding/profile_binding.dart';
import 'package:iotdemoflutter/features/profile/screen/profile_screen.dart';
import 'package:iotdemoflutter/features/wifi_login/binding/wifi_binding.dart';
import 'package:iotdemoflutter/features/wifi_login/screen/wifi_login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:iotdemoflutter/Core/utils/common_string.dart';

import '../../features/Login/binding/login_binding.dart';
import '../../features/Login/screen/login_screen.dart';
import '../../features/signup/binding/sign_up_binding.dart';
import '../../features/signup/screen/sign_up_screen.dart';

class MyRoutes {
  static const String root = "/";
  static String signUpscreen = "/signupscreen";
  static String dashboardscreen = "/dashboardscreen";

  static String wifiloginscreen = "/wifiloginscreen";
  static String bottomtabscreen = "/bottomtabscreen";
  static String changePassword = "/changePassword";
  static String profilescreen = "/profilescreen";

}

List<GetPage> appPages() => [
      GetPage(
        name: MyRoutes.root,
        page: () => LoginScreen(),
        fullscreenDialog: true,
        binding: LoginBinding(),
        transition: CommonString.transition,
      ),
      GetPage(
        name: MyRoutes.signUpscreen,
        page: () => SignUpScreen(),
        fullscreenDialog: true,
        binding: SignUpBinding(),
        transition: CommonString.transition,
      ),
      GetPage(
        name: MyRoutes.wifiloginscreen,
        page: () => WifiLoginScreen(),
        fullscreenDialog: true,
        binding: WifiLoginBinding(),
        transition: CommonString.transition,
      ),
      GetPage(
        name: MyRoutes.bottomtabscreen,
        page: () => BottomTabScreen(),
        fullscreenDialog: true,
        binding: BottomTabBinding(),
        transition: CommonString.transition,
      ),
      GetPage(
        name: MyRoutes.dashboardscreen,
        page: () => DashboardScreen(),
        fullscreenDialog: true,
        binding: DashboardBinding(),
        transition: CommonString.transition,
      ),
      GetPage(
        name: MyRoutes.changePassword,
        page: () => ChangePasswordScreen(),
        fullscreenDialog: true,
        binding: ChangePasswordBinding(),
        transition: CommonString.transition,
      ),
  GetPage(
    name: MyRoutes.profilescreen,
    page: () => ProfileScreen(),
    fullscreenDialog: true,
    binding: ProfileBinding(),
    transition: CommonString.transition,
  )
    ];
