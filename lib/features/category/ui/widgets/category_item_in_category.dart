import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemInCategory extends StatelessWidget {
  final bool? isSelected;
  const CategoryItemInCategory({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
          width: 78.w,
          decoration: BoxDecoration(
              color: isSelected == true
                  ? ColorManger.red.withValues(alpha: .2)
                  : ColorManger.grayLight,
              border: Border.all(
                  color: isSelected == true
                      ? ColorManger.red.withValues(alpha: .2)
                      : ColorManger.grayLight,
                  width: 1),
              borderRadius: BorderRadius.circular(8.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Image.asset(
                    Assets.pic2,
                    width: 48.w,
                    height: 48.h,
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Text(
                    'category_item',
                    style: TextStyles.font12MadaRegularBlack,
                    textAlign: TextAlign.center,
                  ).tr(),
                )
              ],
            ),
          )),
    );
  }
}
