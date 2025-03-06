import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/features/home/ui/widget/discount_item.dart';
import 'package:circletraning/features/home/ui/widget/product_icon.dart';
import 'package:circletraning/features/product_details/ui/product_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorManger.grayLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Assets.pic3,
                    width: 134.w,
                    height: 90.h,
                  ),
                  Positioned(
                    top: -8.h,
                    right: -8.w,
                    child: ProductIcons(
                      icon: AppIcons.heartIcon,
                    ),
                  ),
                  Positioned(
                    top: -8.h,
                    left: -8.w,
                    child: const DiscountItem(),
                  ),
                ],
              ),
            ),
            verticalSpace(8),
            Text(
              'meat_and_poultry',
              style: TextStyles.font14MadaRegularBlack,
            ).tr(),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '160',
                      style: TextStyles.font16MadaSemiBoldBlack,
                    ),
                    horizontalSpace(4),
                    Text(
                      tr('egp'),
                      style: TextStyles.font10MadaRegularBlack,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: ProductIcons(
                    icon: AppIcons.addCartIcon,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
