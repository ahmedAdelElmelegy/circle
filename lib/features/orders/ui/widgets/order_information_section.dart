import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/data/models/response/order_model/order_data.dart';
import 'package:circle/features/orders/ui/widgets/order_list_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInformationSection extends StatelessWidget {
  final OrderData orderData;
  const OrderInformationSection({
    super.key,
    required this.orderData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
          color: ColorManger.red.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Row(
            children: [
              SvgIcon(AppIcons.idIcon),
              horizontalSpace(12),
              Text(
                '#${orderData.id}',
                style: TextStyles.font18MadaSemiBoldBlack
                    .copyWith(color: ColorManger.red),
              ),
            ],
          ),
          verticalSpace(20),
          Row(
            children: [
              SvgIcon(AppIcons.calenderIcon),
              horizontalSpace(12),
              Text(
                '${orderData.date}',
                style: TextStyles.font14MadaSemiBoldBlack,
              ),
              horizontalSpace(8),
              Text(
                '-',
                style: TextStyles.font14MadaSemiBoldBlack,
              ),
              horizontalSpace(8),
              Text(
                '${orderData.time}',
                style: TextStyles.font14MadaSemiBoldBlack,
              ),
            ],
          ),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.restBranchIcon,
              title: 'branch',
              subtitle: 'branch1'.tr()),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.locationIcon,
              title: 'delivery_address',
              subtitle: orderData.address!),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.payIcon,
              title: 'payment_method',
              subtitle: orderData.payType!),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.notesIcon,
              title: 'notes',
              subtitle: orderData.notes ?? 'no_notes'.tr()),
          verticalSpace(20),
        ],
      ),
    );
  }
}
