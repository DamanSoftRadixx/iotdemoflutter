import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iotdemoflutter/Core/utils/image_resources.dart';
import 'package:get/get.dart';
import 'package:iotdemoflutter/Core/common_functionality/dismiss_keyboard.dart';
import 'package:iotdemoflutter/Core/common_ui/asset_widget/common_image_widget.dart';
import 'package:iotdemoflutter/Core/common_ui/common_button/custom_icon_button.dart';
import 'package:iotdemoflutter/Core/common_ui/text/app_text_widget.dart';
import 'package:iotdemoflutter/Core/theme/app_color_palette.dart';

Widget commonTextFieldWidget(
    {required TextEditingController controller,
    String? title,
    String? hint,
    required FocusNode focusNode,
    Function(String value)? onChanged,
    String? errorMsg,
    bool? isError,
    bool? readOnly,
    bool? autoFocus,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int? maxLength,
    TextCapitalization? textCapitalization,
    List<TextInputFormatter>? inputFormatters,
    double? height,
    int? maxLines}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (title != null && title != "")
        AppTextWidget(
          style: CustomTextTheme.normalText(
            color: lightColorPalette.black,
          ),
          text: title ?? "",
          textAlign: TextAlign.center,
        ).paddingOnly(bottom: 3.0.h),
      GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
          width: 1.sw,
          height: height ?? 46.h,
          padding: EdgeInsets.only(top: 0.h),
          decoration: decoration(isSelected: focusNode.hasFocus),
          child: Center(
            child: TextFormField(
              inputFormatters: inputFormatters ?? const [],
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              controller: controller,
              maxLines: maxLines ?? 1,
              minLines: 1,
              maxLength: maxLength ?? 300,
              onChanged: onChanged,
              expands: false,
              readOnly: readOnly ?? false,
              autofocus: autoFocus ?? false,
              focusNode: focusNode,
              decoration: InputDecoration(
                isCollapsed: true,
                counterText: "",
                contentPadding: EdgeInsets.only(left: 15.0, right: 15.w),
                border: InputBorder.none,
                hintText: hint ?? "",
                hintStyle: CustomTextTheme.normalText(
                    color: lightColorPalette.black.withOpacity(0.5)),
              ),
              style: CustomTextTheme.normalText(color: lightColorPalette.black),
            ),
          ),
        ),
      ),
      Visibility(
        visible: isError ?? false,
        child: Align(
          alignment: Alignment.topLeft,
          child: AppTextWidget(
            text: errorMsg ?? "",
            style: CustomTextTheme.bottomTabs(
              color: lightColorPalette.redDark,
            ),
          ).paddingOnly(top: 5.h),
        ),
      )
    ],
  );
}

Widget commonEmailTextFieldWidget({
  required TextEditingController controller,
  String? title,
  String? hint,
  required FocusNode focusNode,
  Function(String value)? onChanged,
  String? errorMsg,
  bool? isError,
  bool? readOnly,
  bool? autoFocus,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  int? maxLength,
  TextCapitalization? textCapitalization,
  List<TextInputFormatter>? inputFormatters,
  double? height,
  int? maxLines,
  required bool isShowCrossIcon,
  final VoidCallback? onPress,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (title != null && title != "")
        AppTextWidget(
          style: CustomTextTheme.normalText(
            color: lightColorPalette.black,
          ),
          text: title ?? "",
          textAlign: TextAlign.center,
        ).paddingOnly(bottom: 3.0.h),
      GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
          width: 1.sw,
          height: height ?? 46.h,
          padding: EdgeInsets.only(top: 0.h),
          decoration: decoration(isSelected: focusNode.hasFocus),
          child: Row(
            children: [
              Flexible(
                flex: 8,
                child: TextFormField(
                  inputFormatters: inputFormatters ?? const [],
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  controller: controller,
                  maxLines: maxLines ?? 1,
                  minLines: 1,
                  maxLength: maxLength ?? 300,
                  onChanged: onChanged,
                  expands: false,
                  readOnly: readOnly ?? false,
                  autofocus: autoFocus ?? false,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    counterText: "",
                    contentPadding: EdgeInsets.only(left: 15.0, right: 15.w),
                    border: InputBorder.none,
                    hintText: hint ?? "",
                    hintStyle: CustomTextTheme.normalText(
                        color: lightColorPalette.black.withOpacity(0.5)),
                  ),
                  style: CustomTextTheme.normalText(
                      color: lightColorPalette.black),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: CustomTapState(
                    padding: EdgeInsets.zero,
                    onTap: onPress == null
                        ? null
                        : () {
                            onPress();
                          },
                    child: AssetWidget(
                      asset: Asset(
                          type: AssetType.svg, path: isShowCrossIcon ? "" : ""),
                    ),
                  )),
            ],
          ),
        ),
      ),
      Visibility(
        visible: isError ?? false,
        child: Align(
          alignment: Alignment.topLeft,
          child: AppTextWidget(
            text: errorMsg ?? "",
            style: CustomTextTheme.bottomTabs(
              color: lightColorPalette.redDark,
            ),
          ).paddingOnly(top: 5.h),
        ),
      )
    ],
  );
}

Widget commonPasswordText(
    {required final String title,
    required bool passwordVisible,
    final VoidCallback? onPress,
    required final TextEditingController controller,
    required FocusNode focusNode,
    String? errorMsg,
    bool? isError,
    String? hint,
    Function(String value)? onChanged,
    TextInputType? keyboardType,
    TextInputAction? textInputAction}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != "")
        Padding(
          padding: EdgeInsets.only(bottom: 3.h),
          child: AppTextWidget(
            style: CustomTextTheme.normalText(
              color: lightColorPalette.black,
            ),
            text: title ?? "",
            textAlign: TextAlign.center,
            // TextStyle(fontSize: 16.sp),
          ),
        ),
      GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
          width: 1.sw,
          height: 44.h,
          decoration: decoration(isSelected: focusNode.hasFocus),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 8,
                child: TextFormField(
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  maxLines: 1,
                  minLines: 1,
                  expands: false,
                  maxLength: 50,
                  focusNode: focusNode,
                  controller: controller,
                  obscureText: passwordVisible,
                  onChanged: onChanged,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[ ]')),
                  ],
                  decoration: InputDecoration(
                    hintStyle: CustomTextTheme.normalText(
                        color: lightColorPalette.black.withOpacity(0.5)),
                    border: InputBorder.none,
                    counterText: "",
                    hintText: hint ?? "",
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  ),
                  style: CustomTextTheme.normalText(
                      color: lightColorPalette.black),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: CustomTapState(
                    padding: EdgeInsets.zero,
                    onTap: onPress == null
                        ? null
                        : () {
                            onPress();
                          },
                    child: AssetWidget(
                       color: lightColorPalette.black,
                      asset: Asset(
                          type: AssetType.svg,
                          path:
                          passwordVisible
                              ? ImageResource.hideEye
                              : ImageResource.openEye),
                    ),
                  )),
            ],
          ),
        ),
      ),
      Visibility(
        visible: isError ?? false,
        child: Align(
          alignment: Alignment.topLeft,
          child: AppTextWidget(
            text: errorMsg ?? "",
            style: CustomTextTheme.bottomTabs(
              color: lightColorPalette.redDark,
            ),
          ).paddingOnly(top: 5.h),
        ),
      ),
    ],
  );
}


Widget commonSearchFieldWidget({
  required TextEditingController controller,
  Function(String value)? onChanged,
  required FocusNode focusNode,
  required String searchHint,
}) {
  return GestureDetector(
    onTap: () {
      focusNode.requestFocus();
    },
    child: Container(
      width: 1.sw,
      height: 34.h,
      decoration: decorationSearchTextField(isSelected: focusNode.hasFocus),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 12.w,
          ),
          AssetWidget(
            color: lightColorPalette.grey,
            asset: Asset(type: AssetType.svg, path: ""),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              maxLines: 1,
              minLines: 1,
              onChanged: onChanged,
              expands: false,
              focusNode: focusNode,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.only(left: 8.0, right: 15.w),
                border: InputBorder.none,
                hintText: searchHint,
                hintStyle: CustomTextTheme.normalText(
                    color: lightColorPalette.black.withOpacity(0.5)),
              ),
              style: CustomTextTheme.normalText(color: lightColorPalette.black),
            ),
          )
        ],
      ),
    ),
  );
}
