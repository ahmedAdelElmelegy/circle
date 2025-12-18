import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/pay_and_delevary/data/models/body/pay_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayItem extends StatelessWidget {
  final PayModel inviceItem;
  const PayItem({super.key, required this.inviceItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIcon(
          inviceItem.icon,
          width: 20.w,
          height: 20.h,
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                inviceItem.title.tr(),
                style: TextStyles.font12MadaRegularGray,
              ),
              verticalSpace(4),
              Text(
                inviceItem.subtitle.tr(),
                maxLines: 1,
                style: TextStyles.font14MadaRegularBlack,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
