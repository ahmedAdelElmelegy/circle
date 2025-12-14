import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/data/models/setting_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnInSetting extends StatelessWidget {
  final SettingModel settingModel;
  const ColumnInSetting({super.key, required this.settingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      height: 97.h,
      width: 103.w,
      child: Column(
        children: [
          SvgIcon(
            settingModel.icon,
            width: 48.w,
            height: 48.h,
          ),
          verticalSpace(12),
          Text(
            settingModel.title.tr(),
            style: TextStyles.font14MadaSemiBoldBlack,
          ),
        ],
      ),
    );
  }
}
