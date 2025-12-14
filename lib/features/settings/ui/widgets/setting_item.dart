import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/data/models/setting_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
  // final String text;
  // final String icon;
  // final VoidCallback? onTap;
  final SettingModel settingData;
  const SettingItem({super.key, required this.settingData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: settingData.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            SvgIcon(settingData.icon, width: 20.w, height: 20.h),
            horizontalSpace(12),
            Text(
              settingData.title.tr(),
              style: TextStyles.font14MadaRegularBlack,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 24.sp,
              color: ColorManger.gray,
            ),
          ],
        ),
      ),
    );
  }
}
