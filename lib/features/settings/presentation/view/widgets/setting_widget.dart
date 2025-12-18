import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/features/settings/presentation/view/widgets/delete_accounte_item.dart';
import 'package:circle/features/settings/presentation/view/widgets/setting_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorManger.grayLight),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'settings'.tr(),
            style: TextStyles.font12MadaRegularGray,
          ),
          verticalSpace(16),
          const SettingActionListView(),
          DeleteAccountItem(
            onPressed: () {},
          )
        ]));
  }
}
