import 'package:circle/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const LoadingWidget({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManger.grayLight,
      highlightColor: ColorManger.grayMoreLight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorManger.white,
        ),
        height: height ?? double.infinity,
        width: width ?? double.infinity,
      ),
    );
  }
}
