import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderListTitleWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  const OrderListTitleWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIcon(
          icon,
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.tr(),
              style: TextStyles.font12MadaRegularGray
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            verticalSpace(3),
            Text(
              subtitle.tr(),
              style: TextStyles.font14MadaRegularBlack
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }
}
