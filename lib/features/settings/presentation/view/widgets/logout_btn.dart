import 'package:circle/core/di/injection.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/sign_up/data/repo/save_user_data.dart';
import 'package:circle/features/login/presentation/view/screens/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SaveUserData saveUserData = getIt();
    return GestureDetector(
      onTap: () {
        if (saveUserData.getUserToken() == '') {
          push(const LoginScreen());
        } else {
          saveUserData.clearSharedData();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 167.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorManger.gray, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              saveUserData.getUserToken() == ''
                  ? AppIcons.login
                  : AppIcons.logoutIcon,
              width: 24.w,
              height: 24.h,
            ),
            horizontalSpace(12),
            Text(saveUserData.getUserToken() == '' ? 'in'.tr() : 'logout'.tr(),
                style: TextStyles.font14MadaRegularBlack
                    .copyWith(color: ColorManger.gray)),
          ],
        ),
      ),
    );
  }
}
