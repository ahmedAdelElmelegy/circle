
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/extention.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:circletraning/features/sign_up/ui/sign_up.dart';
import 'package:circletraning/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            saveUserData.getUserData() == null
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 12.h),
                    width: 96.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManger.red),
                      borderRadius: BorderRadius.circular(16.r),
                      color: ColorManger.grayLight,
                      image: DecorationImage(
                        image: AssetImage(Assets.initPhoto),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    clipBehavior: Clip.none,
                    margin: EdgeInsets.symmetric(vertical: 12.h),
                    width: 96.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManger.red),
                      borderRadius: BorderRadius.circular(16.r),
                      color: ColorManger.grayLight,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedImage(
                        image: saveUserData.getUserData()!.image!,
                      ),
                    ),
                  ),
            GestureDetector(
              onTap: () {
                push(const SignUp());
              },
              child: Container(
                padding: EdgeInsets.all(5.sp),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: ColorManger.white),
                child: SvgIcon(AppIcons.editProfileIcon,
                    width: 24.w, height: 24.h),
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Text(
          saveUserData.getUserData() == null
              ? 'user_name'.tr()
              : '${saveUserData.getUserData()!.firstName!} ${saveUserData.getUserData()!.lastName!}',
          style: TextStyles.font18MadaSemiBoldBlack,
        ),
        verticalSpace(16),
      ],
    );
  }
}
