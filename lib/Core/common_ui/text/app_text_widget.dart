import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  dynamic OnTap;

  AppTextWidget({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.OnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
