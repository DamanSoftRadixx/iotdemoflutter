import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTapState extends StatelessWidget {
  final Widget child;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  // final VoidCallback onPressed;
  final void Function()? onTap;

  const CustomTapState(
      {Key? key,
      required this.child,
      this.iconSize,
      required this.onTap,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
        data: const CupertinoThemeData(primaryColor: Colors.transparent),
        child: CupertinoButton.filled(
          borderRadius: BorderRadius.zero,
          minSize: iconSize,
          padding: padding ?? EdgeInsets.all(12.w),
          //onPressed: () => onPressed(),
          onPressed: onTap,
          child: child,
        ));
  }
}

class CommonInkwell extends StatelessWidget {
  final Widget child;

  final void Function()? onTap;

  const CommonInkwell({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
