import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountItem extends StatelessWidget {
  final String offerValue;
  const DiscountItem({super.key, required this.offerValue});

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
            '$offerValue%',
            style: TextStyles.font12MadaRegularWhite,
          ),
        ));
  }
}
