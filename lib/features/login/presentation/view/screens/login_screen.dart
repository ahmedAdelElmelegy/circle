import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/login/presentation/view/widget/login_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgIcon(
                  AppIcons.logoAndNameIcon,
                  height: 120.h,
                  width: 134.w,
                ),
              ),
              verticalSpace(64),
              Text(
                'hey'.tr(),
                style: TextStyles.font28MadaRegularGray,
              ),
              verticalSpace(8),
              Text(
                'sign_in_now'.tr(),
                style: TextStyles.font14MadaRegularBlack
                    .copyWith(color: ColorManger.gray),
              ),
              verticalSpace(24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorManger.grayLight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgIcon(
                          AppIcons.flagIcon,
                          width: 48,
                          height: 32,
                        ),
                        horizontalSpace(12),
                        Text(
                          'egypt'.tr(),
                          style: TextStyles.font14MadaRegularBlack,
                        ),
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_down,
                        color: ColorManger.red)
                  ],
                ),
              ),
              verticalSpace(16),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
