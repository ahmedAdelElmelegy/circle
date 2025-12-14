import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/data/models/response/product_model/product_model_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayAndDelevaryItem extends StatelessWidget {
  final ProductModelData product;
  const PayAndDelevaryItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: Row(
        children: [
          SizedBox(
              width: 72.w,
              height: 48.h,
              child: CachedImage(
                image: product.image!,
              )),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title!,
                  maxLines: 1,
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
                          '${product.weightUnit!}',
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
                          '${product.price! * product.weightUnit!}',
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
