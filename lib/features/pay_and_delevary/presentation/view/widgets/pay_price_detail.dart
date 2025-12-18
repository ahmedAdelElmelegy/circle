import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/point_check_box.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PayPriceDetail extends StatefulWidget {
  final CalculateOrderCostProvider provider;
  const PayPriceDetail({super.key, required this.provider});

  @override
  State<PayPriceDetail> createState() => _PayPriceDetailState();
}

class _PayPriceDetailState extends State<PayPriceDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'delivery'.tr(),
              style: TextStyles.font12MadaRegularGray,
            ),
            Row(
              children: [
                Text(
                  widget.provider.calculateOrderData!.deliveryPrice.toString(),
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
        ),
        verticalSpace(12),
        Divider(
          color: ColorManger.gray.withValues(alpha: .1),
        ),
        verticalSpace(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PointCheckBox(
                  onPointTaped: (value) {
                    widget.provider.usePoint = value;
                    setState(() {});
                  },
                ),
                horizontalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'use_points'.tr(),
                      style: TextStyles.font12MadaRegularGray,
                    ),
                    verticalSpace(2),
                    Text(
                      widget.provider.calculateOrderData!.points.toString(),
                      style: TextStyles.font12MadaRegularGray,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  widget.provider.calculateOrderData!.totalPoints.toString(),
                  style: TextStyles.font16MadaSemiBoldBlack,
                ),
                horizontalSpace(6),
                Text(
                  'egp'.tr(),
                  style: TextStyles.font12MadaRegularGray,
                ),
              ],
            )
          ],
        ),
        verticalSpace(12),
        Divider(
          color: ColorManger.gray.withValues(alpha: .1),
        ),
        verticalSpace(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'total'.tr(),
              style: TextStyles.font14MadaSemiBoldBlack,
            ),
            Row(
              children: [
                Text(
                  widget.provider.calculateOrderData!.grandTotal.toString(),
                  style: TextStyles.font18MadaSemiBoldBlack
                      .copyWith(color: ColorManger.red),
                ),
                horizontalSpace(6),
                Text(
                  'egp'.tr(),
                  style: TextStyles.font12MadaRegularRed,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
