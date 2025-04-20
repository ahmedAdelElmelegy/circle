import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductIcons extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final Color? iconColor;
  final String icon;
  const ProductIcons(
      {super.key, this.onTap, this.color, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? ColorManger.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
          child: SvgIcon(
            color: iconColor,
            icon,
          ),
        ),
      ),
    );
  }
}
