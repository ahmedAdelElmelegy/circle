import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/cart/ui/widget/counter_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.productDetails,
                width: 100.w,
                height: 66.h,
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'meat_and_poultry'.tr(),
                    style: TextStyles.font14MadaSemiBoldBlack,
                  ),
                  verticalSpace(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgIcon(
                        AppIcons.priceIcon,
                        width: 16.w,
                        height: 16.h,
                      ),
                      horizontalSpace(4),
                      Text(
                        '280',
                        style: TextStyles.font16MadaSemiBoldBlack,
                      ),
                      horizontalSpace(4),
                      Text(
                        'egp'.tr(),
                        style: TextStyles.font12MadaRegularBlack,
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              SvgIcon(
                AppIcons.deleteIcon,
                width: 20.w,
                height: 20.h,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      children: [
                        const CounterButton(
                          icon: Icons.remove,
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorManger.white,
                                border: Border.all(
                                    color: ColorManger.grayLight, width: 4),
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 12.h),
                              child: Text(
                                '2',
                                style: TextStyles.font16MadaSemiBoldBlack,
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        const CounterButton(
                          icon: Icons.add,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(16),
                Column(
                  children: [
                    Text(
                      'total'.tr(),
                      style: TextStyles.font12MadaRegularBlack,
                    ),
                    verticalSpace(4),
                    Row(
                      children: [
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
