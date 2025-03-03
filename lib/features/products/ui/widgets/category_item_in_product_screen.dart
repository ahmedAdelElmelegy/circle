import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemInProductScreen extends StatelessWidget {
  final bool? isActive;
  const CategoryItemInProductScreen({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManger.red.withValues(alpha: .01),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: isActive == true
                  ? ColorManger.red.withValues(alpha: .1)
                  : ColorManger.red.withValues(alpha: .01),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                  color: isActive == true
                      ? ColorManger.red
                      : ColorManger.red.withValues(alpha: .01),
                  width: 1)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(Assets.pic2, width: 24.w, height: 24.h),
                Text(
                  'category_item'.tr(),
                  style: TextStyles.font12MadaRegularBlack,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
