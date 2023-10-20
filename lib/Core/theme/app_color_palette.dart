import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/constants/common_strings.dart';

class AppColorPalette {
  final MaterialColor primarySwatch;
  final MaterialColor secondarySwatch;
  final MaterialColor additionalSwatch1;
  final MaterialColor whiteColorPrimary;
  final MaterialColor primaryBlack;

  final Color transparentColor;

  // final Color backgroundColor;
  final Color redDark;

  // final Color primaryBlue;
  // final Color primaryDarkblue;
  // final Color stroke;
  // final Color primaryGrey;
  final Color redBackground;
  final Color greenDark;
  final Color greenBackground;
  final Color errorColor;
  final Color black;
  final Color grey;
  final Color greyBg;
  final Color textfieldGrey;
  final Color primaryBlue;
  final Color royalBlue;
  final Color forestGreen;
  final Color red;
  final Color goldenrod;
  final Color dodgerBlue;
  final Color sunflowerYellow;
  final Color emeraldGreen;
  final Color green;
  final Color orange;
  final Color red1;

  AppColorPalette({
    required this.primarySwatch,
    // required this.blueBackground,
    required this.secondarySwatch,
    required this.additionalSwatch1,
    required this.whiteColorPrimary,
    required this.transparentColor,
    required this.primaryBlack,
    // required this.backgroundColor,
    required this.redDark,
    // required this.primaryBlue,
    // required this.primaryDarkblue,
    // required this.stroke,
    required this.errorColor,
    required this.redBackground,
    required this.greenDark,
    required this.greenBackground,
    required this.black,
    required this.grey,
    required this.greyBg,
    required this.textfieldGrey,
    required this.primaryBlue,
    required this.royalBlue,
    required this.forestGreen,
    required this.red,
    required this.goldenrod,
    required this.dodgerBlue,
    required this.emeraldGreen,
    required this.sunflowerYellow,
    required this.green,
    required this.orange,
    required this.red1,
  });
}

AppColorPalette lightColorPalette = AppColorPalette(
  primaryBlack: const MaterialColor(
    0xff000000,
    const <int, Color>{
      50: const Color(0xff000000), //10%
      100: const Color(0xff000000), //20%
      200: const Color(0xff000000), //30%
      300: const Color(0xff000000), //40%
      400: const Color(0xff000000), //50%
      500: const Color(0xff000000), //60%
      600: const Color(0xff000000), //70%
      700: const Color(0xff000000), //80%
      800: const Color(0xff000000), //90%
      900: const Color(0xff000000), //100%
    },
  ),
  primarySwatch: const MaterialColor(800, {
    900: Color(0xFFFB6900),
    800: Color(0xFFFB6900),
  }),
  secondarySwatch: const MaterialColor(600, {
    900: Color(0xFF766C68),
  }),
  additionalSwatch1: const MaterialColor(800, {
    900: Color(0xFFC6C2C0),
    800: Color(0xFF1E1410),
    700: Color(0xFFE0DEDC),
    600: Color(0xFFE9E9E9),
  }),
  whiteColorPrimary: const MaterialColor(900, {
    900: Color(0xFFFFFFFF),
    800: Color(0xFFFAFAFA),
    700: Color(0xFFF5F5F5),
    600: Color(0xFFF9F9F9),
  }),
  transparentColor: Colors.transparent,
  redDark: const Color(0xFFF51F1F),
// backgroundColor: const Color(0xFFEDF4FF),
// stroke: const Color(0xFFB3BAC6),
  greenBackground: const Color(0xFFE0FFDF),
  greenDark: const Color(0xFF006400),
  primaryBlue: const Color(0xFF0060F7),
// black: const Color(0xFF1A4563),
// primaryGrey: const Color(0xFF757F8E),
  redBackground: const Color(0xFFFFEDED),
  black: const Color(0xFF0A0A0C),
  grey: const Color(0xFF6C6868),
  greyBg: const Color(0xFFF3F3F3),
  textfieldGrey: const Color(0xffeeeeee),
  errorColor: const Color(0xffb85e53),
  dodgerBlue: const Color(0xff1E90FF),
  emeraldGreen: const Color(0xff008000),
  forestGreen: const Color(0xff228B22),
  goldenrod: const Color(0xffDAA520),
  red: const Color(0xffb85e53),
  royalBlue: const Color(0xff4169E1),
  sunflowerYellow: const Color(0xffFFD700),
  green: Colors.green,
  orange: const Color(0xffF78500),
  red1: const Color(0xFFc70000),
);
// TextTheme lightTextTheme = TextTheme(
//   ///Heading 1
//   displayLarge: TextStyle(
//     fontFamily: CommonStrings.generalSans,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.w600,
//     height: 1.33,
//     color: const Color(0xFF626280),
//   ),

//   ///Heading 2
//   displayMedium: TextStyle(
//     fontFamily: CommonStrings.generalSans,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w600,
//     height: 1.25,
//     color: const Color(0xFF626280),
//   ),

//   ///Normat text , Subtext
//   headlineMedium: TextStyle(
//     fontFamily: CommonStrings.generalSans,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w500,
//     height: 1,
//     color: const Color(0xFF626280),
//   ),

//   // Button text ,Category Text
//   bodyLarge: TextStyle(
//     fontFamily: CommonStrings.generalSans,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w600,
//     height: 1,
//     color: const Color(0xFF626280),
//   ),

//   ///Bottom tabs
//   bodyMedium: TextStyle(
//     fontFamily: CommonStrings.generalSans,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w500,
//     height: 1,
//     color: const Color(0xFF626280),
//   ),

//   ///Small text
//   titleSmall: TextStyle(
//     fontFamily: CommonStrings.generalSans,
//     fontSize: 10.sp,
//     fontWeight: FontWeight.w500,
//     height: 1,
//     color: const Color(0xFF626280),
//   ),
// );

class CustomTextTheme {
  static TextStyle heading1({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      height: 1.33,
      color: color,
    );
  }

  static TextStyle heading1WithLetterSpacing({required Color color}) {
    return TextStyle(
        fontFamily: CommonStrings.generalSans,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 0.96);
  }

  static TextStyle heading2({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: color,
    );
  }

  static TextStyle heading3({required Color color}) {
    return TextStyle(
        fontFamily: CommonStrings.generalSans,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 0.72);
  }

  static TextStyle normalText({required Color color}) {
    return TextStyle(
        fontFamily: CommonStrings.generalSans,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.56);
  }

  static TextStyle normalText2({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle normalTextWithWeight600({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.56,
      color: color,
    );
  }

  static TextStyle normalTextWithLineHeight20({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      height: 1.42,
      color: color,
    );
  }

  static TextStyle subtext({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      height: 1,
      color: color,
    );
  }

  static TextStyle buttonText({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      height: 1,
      color: color,
    );
  }

  static TextStyle categoryText({required Color color, double? height}) {
    return TextStyle(
        letterSpacing: 0.56,
        fontFamily: CommonStrings.generalSans,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: height ?? 1,
        color: color);
  }

  static TextStyle bottomTabs({required Color color, double? height}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      height: height ?? 1,
      color: color,
    );
  }

  static TextStyle bottomTabsithFontWeight600({required Color color}) {
    return TextStyle(
      fontFamily: CommonStrings.generalSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      height: 1,
      color: color,
    );
  }

  static TextStyle smallText({required Color color}) {
    return TextStyle(
        fontFamily: CommonStrings.generalSans,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        height: 1,
        color: color);
  }
}

BoxDecoration decorationSearchTextField({required bool isSelected}) {
  return BoxDecoration(
      color: lightColorPalette.whiteColorPrimary.shade900,
      borderRadius: BorderRadius.circular(10.r),
      shape: BoxShape.rectangle,
      border: Border.all(
          color: isSelected ? lightColorPalette.black : lightColorPalette.grey,
          width: isSelected ? 1 : 0.3));
}

BoxDecoration decorationDateTextField({required bool isSelected}) {
  return BoxDecoration(
      color: lightColorPalette.whiteColorPrimary.shade900,
      borderRadius: BorderRadius.circular(10.r),
      shape: BoxShape.rectangle,
      boxShadow: isSelected
          ? [
              BoxShadow(
                blurRadius: 14,
                color: lightColorPalette.black.withOpacity(0.25),
                offset: const Offset(0, 6),
                spreadRadius: 0,
              ),
            ]
          : [],
      border: Border.all(
          color: isSelected ? lightColorPalette.black : lightColorPalette.grey,
          width: isSelected ? 1 : 0.3));
}

BoxDecoration decoration({required bool isSelected, bool isError = false}) {
  return BoxDecoration(
      color: lightColorPalette.textfieldGrey,
      borderRadius: BorderRadius.circular(10.r),
      shape: BoxShape.rectangle,
      border: Border.all(
          color: isError
              ? lightColorPalette.redDark
              : (isSelected
                  ? lightColorPalette.black
                  : lightColorPalette.grey.withOpacity(0.10)),
          width: isSelected ? 1 : (isError ? 1 : 0.3)));
}

BoxDecoration decorationHome() {
  return BoxDecoration(
      color: lightColorPalette.whiteColorPrimary.shade900,
      borderRadius: BorderRadius.circular(20.r),
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          blurRadius: 24,
          color: lightColorPalette.black.withOpacity(0.20),
          offset: const Offset(0, 2),
          spreadRadius: 0,
        ),
      ],
      border: Border.all(color: lightColorPalette.grey, width: 0.3));
}

BoxDecoration categioryDecoration({required bool isSelected}) {
  return BoxDecoration(
      color: lightColorPalette.whiteColorPrimary.shade900,
      borderRadius: BorderRadius.circular(10.r),
      shape: BoxShape.rectangle,
// boxShadow: isSelected
//     ? [
//         BoxShadow(
//           blurRadius: 14,
//           color: lightColorPalette.black.withOpacity(0.20),
//           offset: const Offset(0, 6),
//           spreadRadius: 0,
//         ),
//       ]
//     : [],
      border: Border.all(
          color: isSelected ? lightColorPalette.black : lightColorPalette.grey,
          width: isSelected ? 1 : 0.3));
}

BoxDecoration decoration2({required Color bgColor}) {
  return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: lightColorPalette.grey, width: 0.3));
}

BoxDecoration decorationWithElevationOnly() {
  return BoxDecoration(
      color: lightColorPalette.whiteColorPrimary.shade900,
      borderRadius: BorderRadius.circular(20.r),
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          blurRadius: 24,
          color: lightColorPalette.black.withOpacity(0.20),
          offset: const Offset(0, 2),
          spreadRadius: 0,
        ),
      ],
      border: Border.all(color: lightColorPalette.grey, width: 0.3));
}

BoxDecoration decorationImage() {
  return BoxDecoration(
      color: lightColorPalette.whiteColorPrimary.shade900,
      borderRadius: BorderRadius.circular(10.r),
      shape: BoxShape.rectangle,
      border: Border.all(color: lightColorPalette.grey, width: 0.3));
}
