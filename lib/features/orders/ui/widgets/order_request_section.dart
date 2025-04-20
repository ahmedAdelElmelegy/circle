import 'dart:async';
import 'package:circle/data/models/body/order_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/features/orders/ui/widgets/edit_and_remove_btn.dart';
import 'package:circle/features/orders/ui/widgets/order_call_person.dart';
import 'package:circle/features/orders/ui/widgets/order_icon.dart';

class OrderStatusSection extends StatefulWidget {
  const OrderStatusSection({super.key, this.onPress});
  final void Function()? onPress;

  @override
  State<OrderStatusSection> createState() => _OrderStatusSectionState();
}

class _OrderStatusSectionState extends State<OrderStatusSection> {
  int currentStep = 0;
  Timer? _timer;

  final List<OrderStep> steps = [
    OrderStep(
        icon: AppIcons.acceptedOrderIcon,
        title: 'request_received',
        value: 0.3,
        isCall: false),
    OrderStep(
        icon: AppIcons.preparingIcon,
        title: 'preparing',
        value: 0.5,
        isCall: false),
    OrderStep(
        icon: AppIcons.deliveredPagIcon,
        title: 'delivered_to_the_representative',
        value: 0.7,
        isCall: true),
    OrderStep(
        icon: AppIcons.deliveryProgressIcon,
        title: 'delivery_is_in_progress',
        value: 0.9,
        isCall: true),
    OrderStep(
        icon: AppIcons.completedOrderIcon,
        title: 'been_completed',
        value: 1.0,
        isCall: false),
  ];

  @override
  void initState() {
    super.initState();
    _startProgressSequence();
  }

  void _startProgressSequence() {
    const stepDuration = Duration(milliseconds: 1500);
    _timer = Timer.periodic(stepDuration, (timer) {
      if (currentStep < steps.length - 1) {
        setState(() => currentStep++);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final step = steps[currentStep];
    final showEditRemove = currentStep == 0;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
          child: Column(
            children: [
              Row(
                children: [
                  OrderIcon(icon: step.icon),
                  horizontalSpace(8),
                  Text(
                    step.title.tr(),
                    style: TextStyles.font14MadaSemiBoldBlack
                        .copyWith(color: ColorManger.gray),
                  ),
                ],
              ),
              verticalSpace(10),
              LinearProgressIndicator(
                minHeight: 8.h,
                borderRadius: BorderRadius.circular(100.r),
                value: step.value,
                backgroundColor: ColorManger.grayLight,
                valueColor: const AlwaysStoppedAnimation(ColorManger.red),
              ),
              verticalSpace(10),
              if (showEditRemove) EditAndRemoveBtn(onPressed: widget.onPress),
            ],
          ),
        ),
        if (step.isCall) const OrderCallPerson(),
      ],
    );
  }
}
