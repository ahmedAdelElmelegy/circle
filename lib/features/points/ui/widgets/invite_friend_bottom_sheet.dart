import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_title_bottom_sheet.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteFriendBottomSheet extends StatelessWidget {
  const InviteFriendBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        )),
        child: Column(
          children: [
            const CustomTitleButtomSheet(title: 'invite_friend'),
            verticalSpace(24),
            Image.asset(
              Assets.qrcode,
              width: 178.w,
              height: 183.h,
            ),
            verticalSpace(24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorManger.grayLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgIcon(AppIcons.copy),
                  Text('num'.tr(), style: TextStyles.font12MadaSemiBoldBlack),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
