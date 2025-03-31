import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemInCategory extends StatelessWidget {
  const ProductItemInCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: ColorManger.grayLight,
      ),
      child: Text(
        'meat_and_poultry',
        style: TextStyles.font12MadaRegularBlack,
      ).tr(),
    );
  }
}
