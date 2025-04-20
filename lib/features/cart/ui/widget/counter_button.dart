import 'package:circle/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;

  const CounterButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManger.grayLight,
        child: InkWell(
          splashColor: ColorManger.red.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Icon(
              icon,
              size: 30.sp,
            ),
          ),
        ));
  }
}
