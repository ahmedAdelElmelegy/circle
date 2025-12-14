import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 24.h,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 36.h,
          left: 36.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.r),
            topRight: Radius.circular(36.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgIcon(
              AppIcons.otp,
              width: 225,
              height: 150,
            ),
            verticalSpace(16),
            Text('otp_message'.tr(), style: TextStyles.font14MadaRegularBlack),
            verticalSpace(16),
            Text(
              '0123456789',
              style: TextStyles.font14MadaRegularBlack,
            ).tr(),
            Column(
              children: [
                PinCodeTextField(
                    appContext: context,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(shape: PinCodeFieldShape.underline),
                    length: 5),
                verticalSpace(16),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'resend_the_code',
                          style: TextStyles.font14MadaRegularWith
                              .copyWith(color: ColorManger.red),
                        ).tr(),
                      ),
                      const Spacer(),
                      Text(
                        '00:00',
                        style: TextStyles.font14MadaRegularBlack,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            CustomButton(title: 'verify', onTap: () {}),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
