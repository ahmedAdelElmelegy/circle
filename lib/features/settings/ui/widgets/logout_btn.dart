import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LoginScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorManger.gray, width: 1),
        ),
        child: Text('logout'.tr(), style: TextStyles.font14MadaSemiBoldBlack),
      ),
    );
  }
}
