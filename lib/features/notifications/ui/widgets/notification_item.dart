import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h, top: 16.h),
      child: Column(
        children: [
          Text(
            'notification_message'.tr(),
            style: TextStyles.font12MadaRegularGray,
          ),
          verticalSpace(4),
          Row(
            children: [
              Text(
                '5',
                style: TextStyles.font14MadaRegularBlack
                    .copyWith(color: ColorManger.red),
              ),
              Text(
                'minites'.tr(),
                style: TextStyles.font14MadaRegularBlack
                    .copyWith(color: ColorManger.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}
