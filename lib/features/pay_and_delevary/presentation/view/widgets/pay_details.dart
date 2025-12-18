import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/features/pay_and_delevary/data/models/body/pay_model.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/pay_item.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayDetails extends StatelessWidget {
  const PayDetails({
    super.key,
    required this.provider,
  });

  final CalculateOrderCostProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: ColorManger.red.withValues(alpha: 0.08)),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          children: [
            PayItem(
              inviceItem: PayModel(
                  title: 'branch',
                  subtitle: 'menoufia'.tr(),
                  icon: AppIcons.restBranchIcon),
            ),
            verticalSpace(12),
            PayItem(
              inviceItem: PayModel(
                  title: 'delivery_address',
                  subtitle: provider.fullAddress,
                  icon: AppIcons.locationIcon),
            ),
            verticalSpace(12),
            PayItem(
              inviceItem: PayModel(
                  title: 'pay_method',
                  subtitle: provider.payType,
                  icon: AppIcons.payIcon),
            ),
            verticalSpace(12),
            PayItem(
              inviceItem: PayModel(
                  title: 'comments',
                  subtitle: provider.noteController.text,
                  icon: AppIcons.notesIcon),
            )
          ],
        ));
  }
}
