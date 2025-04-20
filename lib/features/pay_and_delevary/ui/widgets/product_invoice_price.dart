import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductInvicePrice extends StatelessWidget {
  final String productName;
  final String prodcutPrice;
  final String productCount;
  const ProductInvicePrice({
    super.key,
    required this.productName,
    required this.prodcutPrice,
    required this.productCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'meat_and_poultry'.tr(),
          style: TextStyles.font14MadaRegularBlack,
        ),
        Row(
          children: [
            Text(
              'x',
              style: TextStyles.font12MadaRegularGray,
            ),
            horizontalSpace(4),
            Text(
              productCount,
              style: TextStyles.font14MadaRegularBlack
                  .copyWith(color: ColorManger.gray),
            ),
            horizontalSpace(12),
            Row(
              children: [
                Text(
                  prodcutPrice,
                  style: TextStyles.font16MadaSemiBoldBlack,
                ),
                horizontalSpace(6),
                Text(
                  'egp'.tr(),
                  style: TextStyles.font12MadaRegularGray,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
