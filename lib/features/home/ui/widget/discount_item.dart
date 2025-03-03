import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 33.w,
        height: 19.h,
        decoration: BoxDecoration(
          color: ColorManger.red,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Text(
            '15%',
            style: TextStyles.font12MadaRegularWhite,
          ),
        ));
  }
}
