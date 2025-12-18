import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/features/orders/data/models/response/order_model/order_data.dart';
import 'package:circle/features/orders/presentation/view/widgets/product_list_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderProductSection extends StatelessWidget {
  final OrderData orderData;
  const OrderProductSection({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: ColorManger.grayLight),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Products'.tr(),
                style: TextStyles.font12MadaSemiBoldGray
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              verticalSpace(12),
              Column(
                children: List.generate(
                  orderData.details!.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ProductListTitleWidget(
                      orderDetail: orderData.details![index],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: .3.h,
                color: ColorManger.gray,
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'delivery'.tr(),
                    style: TextStyles.font12MadaRegularBlack,
                  ),
                  Row(
                    children: [
                      Text(
                        orderData.deliveryPrice.toString(),
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
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'total'.tr(),
                    style: TextStyles.font14MadaRegularBlack,
                  ),
                  Row(
                    children: [
                      Text(
                        '${orderData.grandTotal}',
                        style: TextStyles.font18MadaSemiBoldBlack
                            .copyWith(color: ColorManger.primary),
                      ),
                      horizontalSpace(4),
                      Text(
                        'egp'.tr(),
                        style: TextStyles.font12MadaRegularRed,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
