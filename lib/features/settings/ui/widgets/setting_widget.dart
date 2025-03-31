import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/features/settings/ui/widgets/delete_accounte_item.dart';
import 'package:circletraning/features/settings/ui/widgets/setting_list_view.dart';
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
          const SettingListView(),
          DeleteAccountItem(
            onPressed: () {},
          )
        ]));
  }
}
