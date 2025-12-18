import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/features/orders/data/models/response/order_model/detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTitleWidget extends StatelessWidget {
  final OrderDetail orderDetail;
  const ProductListTitleWidget({super.key, required this.orderDetail});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200.w,
          child: Text(
            orderDetail.product!.title!,
            style: TextStyles.font14MadaSemiBoldBlack,
          ),
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
                  '${orderDetail.product!.weightUnit!}',
                  style: TextStyles.font14MadaSemiBoldBlack
                      .copyWith(color: ColorManger.gray),
                ),
              ],
            ),
            horizontalSpace(12),
            Row(
              children: [
                Text(
                  '${orderDetail.product!.price!}',
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
