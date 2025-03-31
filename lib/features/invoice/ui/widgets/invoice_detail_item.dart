import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/models/invoice_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceDetailItem extends StatelessWidget {
  final InvoiceModel inviceItem;
  const InvoiceDetailItem({super.key, required this.inviceItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManger.red.withValues(alpha: 0.08)),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        children: [
          SvgIcon(
            inviceItem.icon,
            width: 20.w,
            height: 20.h,
          ),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                inviceItem.title.tr(),
                style: TextStyles.font12MadaRegularGray,
              ),
              verticalSpace(4),
              Text(
                inviceItem.subtitle.tr(),
                style: TextStyles.font14MadaRegularBlack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
