import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceProductDetails extends StatelessWidget {
  const PriceProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: ColorManger.grayLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: ColorManger.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgIcon(AppIcons.priceIcon),
                    horizontalSpace(8),
                    Text(
                      'price_text'.tr(),
                      style: TextStyles.font14MadaRegularBlack,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'price'.tr(),
                      style: TextStyles.font24MadaSemiBoldRed,
                    ),
                    horizontalSpace(9),
                    Text(
                      'egp'.tr(),
                      style: TextStyles.font12MadaRegularRed,
                    ),
                  ],
                )
              ],
            ),
          ),
          verticalSpace(12),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Icon(
                      Icons.add,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Container(
                  height: 48.h,
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: ColorManger.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    '2',
                    style: TextStyles.font16MadaSemiBoldBlack,
                  ),
                ),
              ),
              horizontalSpace(8),
              InkWell(
                onTap: () {},
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Icon(
                      Icons.remove,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
