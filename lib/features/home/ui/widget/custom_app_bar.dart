import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/cart/ui/cart_screen.dart';
import 'package:circletraning/features/home/ui/widget/app_bar_icon.dart';
import 'package:circletraning/features/notifications/ui/notification_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        height: 72.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgIcon(
              Assets.logo,
              width: 32.w,
              height: 22.h,
            ),
            horizontalSpace(8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'hello',
                  style: TextStyles.font12MadaRegularGray,
                ).tr(),
                Text(
                  'name',
                  style: TextStyles.font16MadaSemiBoldBlack,
                ).tr(),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, NotificationScreen.routeName);
              },
              child: AppBarIcon(
                icon: AppIcons.notificationIcon,
              ),
            ),
            horizontalSpace(8),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: AppBarIcon(
                icon: AppIcons.cartIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
