import 'dart:async';

import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/features/orders/ui/widgets/edit_and_remove_btn.dart';
import 'package:circletraning/features/orders/ui/widgets/order_call_person.dart';
import 'package:circletraning/features/orders/ui/widgets/order_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusSection extends StatefulWidget {
  const OrderStatusSection({
    super.key,
  });

  @override
  State<OrderStatusSection> createState() => _OrderStatusSectionState();
}

class _OrderStatusSectionState extends State<OrderStatusSection> {
  String icon = AppIcons.acceptedOrderIcon;
  String title = 'request_received';
  double value = .3;
  bool isProgress = true;
  bool isCall = false;
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        setState(() {
          icon = AppIcons.preparingIcon;

          title = 'preparing';
          value = .5;
          isProgress = false;
        });
      },
    );
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        icon = AppIcons.deliveredPagIcon;
        title = 'delivered_to_the_representative';
        value = .7;
        isCall = true;
        isProgress = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 4500), () {
      setState(() {
        icon = AppIcons.deliveryProgressIcon;
        title = 'delivery_is_in_progress';
        value = .9;
        isCall = true;
        isProgress = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 6000), () {
      setState(() {
        icon = AppIcons.completedOrderIcon;
        title = 'been_completed';
        value = 1;
        isCall = false;
        isProgress = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
          child: Column(
            children: [
              Row(
                children: [
                  OrderIcon(icon: icon),
                  horizontalSpace(8),
                  Text(
                    title.tr(),
                    style: TextStyles.font14MadaSemiBoldBlack
                        .copyWith(color: ColorManger.gray),
                  )
                ],
              ),
              verticalSpace(10),
              LinearProgressIndicator(
                minHeight: 8.h,
                borderRadius: BorderRadius.circular(100.r),
                value: value,
                backgroundColor: ColorManger.grayLight,
                valueColor: const AlwaysStoppedAnimation(ColorManger.red),
              ),
              verticalSpace(10),
              isProgress == true
                  ? const EditAndRemoveBtn()
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        isCall == true ? const OrderCallPerson() : const SizedBox(),
      ],
    );
  }
}
