import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('about_app', context),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
        child: Column(
          children: [
            SvgIcon(
              AppIcons.logoAndNameIcon,
              height: 120.h,
              width: 134.w,
            ),
            verticalSpace(32),
            Column(
              children: [
                Row(
                  children: [
                    SvgIcon(
                      AppIcons.aboutRecIcon,
                      width: 13,
                      height: 33,
                    ),
                    horizontalSpace(8),
                    Text(
                      'who_are_we'.tr(),
                      style: TextStyles.font18MadaSemiBoldBlack,
                    ),
                  ],
                ),
                verticalSpace(24),
                Text(
                  'about'.tr(),
                  style: TextStyles.font14MadaRegularBlack
                      .copyWith(color: ColorManger.gray),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
