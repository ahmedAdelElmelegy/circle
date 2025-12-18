import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';

import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/orders/data/models/response/order_model/order_data.dart';
import 'package:circle/features/orders/presentation/view_model/order_provider.dart';
import 'package:circle/features/orders/presentation/view/widgets/order_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {
  final OrderData orderData;
  final OrderProvider orderProvider;
  const OrderItem({
    super.key,
    required this.orderData,
    required this.orderProvider,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorManger.grayLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${orderData.id}',
                  style: TextStyles.font18MadaSemiBoldBlack
                      .copyWith(color: ColorManger.red),
                ),
                GestureDetector(
                  onTap: () {
                    push(OrderDetailScreen(
                      orderData: orderData,
                    ));
                  },
                  child: Text('details'.tr(),
                      style: TextStyles.font14MadaRegularBlack
                          .copyWith(color: ColorManger.red)),
                ),
              ],
            ),
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgIcon(AppIcons.calenderIcon, width: 20.w, height: 20.h),
                  horizontalSpace(8),
                  Text(orderData.date.toString(),
                      style: TextStyles.font14MadaRegularBlack),
                ],
              ),
              Row(
                children: [
                  SvgIcon(
                    AppIcons.timerIcon,
                    width: 20.w,
                    height: 20.h,
                  ),
                  horizontalSpace(8),
                  Text(orderData.time.toString(),
                      style: TextStyles.font14MadaRegularBlack),
                ],
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              SvgIcon(
                AppIcons.locationIcon,
                color: ColorManger.gray,
              ),
              horizontalSpace(8),
              Text(orderData.address.toString(),
                  style: TextStyles.font14MadaRegularBlack),
            ],
          ),
          Visibility(
            visible: provider.currentIndex == 0 ? false : true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: ColorManger.gray, width: 1)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Text('expierd'.tr(),
                        style: TextStyles.font14MadaRegularBlack.copyWith(
                          color: ColorManger.red,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
