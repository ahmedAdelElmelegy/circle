import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/extention.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';

import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/provider/order_provider.dart';
import 'package:circletraning/features/orders/ui/widgets/order_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    return Container(
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
                  'num'.tr(),
                  style: TextStyles.font18MadaSemiBoldBlack
                      .copyWith(color: ColorManger.red),
                ),
                GestureDetector(
                  onTap: () {
                    push(const OrderDetailScreen());
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
                  Text('date'.tr(), style: TextStyles.font14MadaRegularBlack),
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
                  Text('time'.tr(), style: TextStyles.font14MadaRegularBlack),
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
              Text('address'.tr(), style: TextStyles.font14MadaRegularBlack),
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
