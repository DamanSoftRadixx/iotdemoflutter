// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../common_ui/app_text_widget.dart';
// import '../../common_ui/asset.dart';
// import '../../common_ui/common_image_widget.dart';
// import '../../constants/app_strings.dart';
// import '../../constants/common_strings.dart';
// import '../../theme/app_color_palette.dart';
// import '../../utils/image_resources.dart';
//
// class NoInternetConnectionScreen extends StatelessWidget {
//   const NoInternetConnectionScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         width: 1.sw,
//         decoration: const BoxDecoration(
//             // color: lightColorPalette.whiteColorPrimary.shade700,
//             /*borderRadius: BorderRadius.circular(16.r),
//             border: Border.all(
//                 color: lightColorPalette.primarySwatch.shade600, width: 1.0)*/
//             ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             AssetWidget(
//               asset: Asset(
//                   type: AssetType.svg,
//                   path: ImageResource.noInternetConnection),
//               height: 158.h,
//               width: 138.w,
//               boxFit: BoxFit.fitWidth,
//             ),
//             /*
//             Icon(
//                 Icons.wifi_off_sharp,
//                 color: lightColorPalette.secondarySwatch.shade900,
//               size: 100.w,
//             ),*/
//             SizedBox(
//               height: 30.h,
//             ),
//             AppTextWidget(
//               text: AppStrings.strNoInternetConnection,
//               style: Theme.of(Get.context!).textTheme.displayLarge!.copyWith(
//                   fontSize: 17.sp,
//                   color: lightColorPalette.primarySwatch.shade900,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: CommonStrings.sfProText),
//               textAlign: TextAlign.start,
//             ),
//             SizedBox(
//               height: 7.h,
//             ),
//             AppTextWidget(
//               text: AppStrings.strPleaseCheckYourInternetConnectivity,
//               style: Theme.of(Get.context!).textTheme.displayLarge!.copyWith(
//                   fontSize: 12.sp,
//                   color: lightColorPalette.primarySwatch.shade800,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: CommonStrings.sfProText ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20.h),
//           ],
//         ).paddingSymmetric(horizontal: 9.w),
//       ).paddingSymmetric(horizontal: 16.w, vertical: 30.h),
//     );
//   }
// }
