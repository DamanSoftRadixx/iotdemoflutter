import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iotdemoflutter/Core/theme/app_color_palette.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

const double _kSize = 80;

class CommonLoader extends StatelessWidget {
  final bool isLoading;
  final Color? color;

  const CommonLoader({
    Key? key,
    required this.isLoading,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Container(
        color: color ?? lightColorPalette.transparentColor,
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: lightColorPalette.black,
              size: _kSize,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressCommonLoader extends StatelessWidget {
  final double? value;
  const ProgressCommonLoader({
    Key? key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.h,
        width: 50.w,
        child: SimpleCircularProgressBar(
          progressStrokeWidth: 5.w,
          backStrokeWidth: 5.w,
          // animationDuration: 1,
          progressColors: const [
            Colors.cyan,
            Colors.green,
            Colors.amberAccent,
            Colors.redAccent,
            Colors.purpleAccent
          ],
          // backColor: Colors.blueGrey,
          mergeMode: true,
          // onGetText: (double value) {
          //   return Text(
          //     value == null ? "" : "${getPercentage(progress: value)}%",
          //   );
          // },
        ),
      ),
    );
  }

  String getPercentage({required double progress}) {
    var percentageProgress = progress * 100;
    var percentageProgressInt = percentageProgress.toInt();

    return percentageProgressInt.toString();
  }
}
