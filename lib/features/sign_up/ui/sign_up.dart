import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/custom_app_bar.dart';
import 'package:circletraning/core/widgets/custom_button.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/home/ui/widget/check_box_item.dart';
import 'package:circletraning/features/profile/ui/widgets/user_name_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  static const String routeName = '/sign_up';
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const CustomAppBarTitle(title: 'create_account'),
                verticalSpace(14),
                SvgIcon(
                  AppIcons.selectPhoto,
                  width: 124,
                  height: 124,
                ),
                verticalSpace(32),
                Row(
                  children: [
                    const UserNameField(title: 'first_name'),
                    horizontalSpace(8),
                    const UserNameField(title: 'last_name')
                  ],
                ),
                verticalSpace(32),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: ColorManger.grayLight,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgIcon(
                            AppIcons.cityIcon,
                            width: 48,
                            height: 32,
                          ),
                          horizontalSpace(12),
                          Text(
                            'cityy'.tr(),
                            style: TextStyles.font14MadaRegularBlack,
                          ),
                        ],
                      ),
                      const Icon(Icons.keyboard_arrow_down,
                          color: ColorManger.red)
                    ],
                  ),
                ),
                verticalSpace(32),
                const CheckBoxItem(cityName: 'invited_by_user'),
              ],
            ),
            CustomButton(
              title: 'confirm',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
