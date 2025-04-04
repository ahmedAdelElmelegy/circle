import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/orders/ui/widgets/order_list_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInformationSection extends StatelessWidget {
  const OrderInformationSection({
    super.key,
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
                'num'.tr(),
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
                'date'.tr(),
                style: TextStyles.font14MadaSemiBoldBlack,
              ),
              horizontalSpace(8),
              Text(
                '-',
                style: TextStyles.font14MadaSemiBoldBlack,
              ),
              horizontalSpace(8),
              Text(
                'time'.tr(),
                style: TextStyles.font14MadaSemiBoldBlack,
              ),
            ],
          ),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.restBranchIcon,
              title: 'branch',
              subtitle: 'branch1'),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.locationIcon,
              title: 'delivery_address',
              subtitle: 'branch1'),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.payIcon,
              title: 'payment_method',
              subtitle: 'cash'),
          verticalSpace(20),
          OrderListTitleWidget(
              icon: AppIcons.notesIcon,
              title: 'notes',
              subtitle: 'Bring fresh shrimp'),
          verticalSpace(20),
        ],
      ),
    );
  }
}
