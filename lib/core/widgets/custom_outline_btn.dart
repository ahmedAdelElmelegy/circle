import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutLineBtn extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final String icon;
  final Color? color;
  const CustomOutLineBtn(
      {super.key,
      required this.title,
      this.onPressed,
      required this.icon,
      this.color});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color ?? ColorManger.red),
          minimumSize: Size(double.infinity, 53.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        onPressed: onPressed,
        label: Text(
          title,
          style: TextStyles.font14MadaRegularBlack
              .copyWith(color: color ?? ColorManger.red),
        ),
        icon: SvgIcon(
          icon,
          color: color ?? ColorManger.red,
        ));
  }
}
