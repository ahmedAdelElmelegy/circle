import 'package:circle/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? padwidth;
  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.padwidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padwidth == null ? 16.0.w : 0),
      child: Container(
          padding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: padwidth ?? 0),
          decoration: BoxDecoration(
            color: color ?? ColorManger.white,
            borderRadius: color != null ? null : BorderRadius.circular(12.r),
            border: Border.all(
              color: ColorManger.grayLight,
              width: 1,
            ),
          ),
          child: child),
    );
  }
}
