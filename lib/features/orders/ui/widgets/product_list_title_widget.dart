import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductListTitleWidget extends StatelessWidget {
  const ProductListTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'meat_and_poultry'.tr(),
          style: TextStyles.font14MadaSemiBoldBlack,
        ),
        Row(
          children: [
            Row(
              children: [
                Text(
                  'x',
                  style: TextStyles.font12MadaRegularGray,
                ),
                horizontalSpace(4),
                Text(
                  '2',
                  style: TextStyles.font14MadaSemiBoldBlack
                      .copyWith(color: ColorManger.gray),
                ),
              ],
            ),
            horizontalSpace(12),
            Row(
              children: [
                Text(
                  '560',
                  style: TextStyles.font16MadaSemiBoldBlack,
                ),
                horizontalSpace(4),
                Text(
                  'egp'.tr(),
                  style: TextStyles.font12MadaRegularGray,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
