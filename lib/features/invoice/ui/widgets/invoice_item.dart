import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: Row(
        children: [
          Image.asset(
            Assets.productDetails,
            width: 72.w,
            height: 48.h,
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'category_item'.tr(),
                  style: TextStyles.font14MadaSemiBoldBlack,
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'x',
                          style: TextStyles.font12MadaRegularRed,
                        ),
                        horizontalSpace(1.5),
                        Text(
                          '2',
                          style: TextStyles.font14MadaRegularBlack
                              .copyWith(color: ColorManger.red),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'total'.tr(),
                          style: TextStyles.font12MadaRegularBlack,
                        ),
                        verticalSpace(4),
                        Text(
                          '560',
                          style: TextStyles.font18MadaSemiBoldBlack
                              .copyWith(color: ColorManger.red),
                        ),
                        horizontalSpace(4),
                        Text(
                          'egp'.tr(),
                          style: TextStyles.font12MadaRegularRed,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
