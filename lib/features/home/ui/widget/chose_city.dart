import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoseCity extends StatelessWidget {
  const ChoseCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManger.red,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          children: [
            SvgIcon(
              AppIcons.pinIcon,
              width: 16.w,
              height: 16.h,
            ),
            horizontalSpace(8),
            Text(
              'city',
              style: TextStyles.font14MadaRegularWith,
            ).tr(),
            horizontalSpace(8),
            const Icon(Icons.expand_more, color: ColorManger.white)
          ],
        ),
      ),
    );
  }
}
