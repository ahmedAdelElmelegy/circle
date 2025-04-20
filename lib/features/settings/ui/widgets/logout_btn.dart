import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/extention.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:circletraning/features/login/ui/login_screen.dart';
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
