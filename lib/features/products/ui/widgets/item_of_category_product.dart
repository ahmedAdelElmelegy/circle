import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemOfCategoryProduct extends StatelessWidget {
  final bool? isActive;
  const ItemOfCategoryProduct({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        // width: 96.w,
        height: 42.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isActive == true ? ColorManger.red : ColorManger.grayLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          'meat_and_poultry'.tr(),
          textAlign: TextAlign.center,
          style: isActive == true
              ? TextStyles.font12MadaRegularWhite
              : TextStyles.font12MadaRegularBlack,
        ),
      ),
    );
  }
}
