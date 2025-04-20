import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderIcon extends StatelessWidget {
  final String icon;
  const OrderIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManger.red.withValues(alpha: .3),
          border: Border.all(color: ColorManger.red)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
        child: SvgIcon(
          icon,
          color: ColorManger.red,
        ),
      ),
    );
  }
}
