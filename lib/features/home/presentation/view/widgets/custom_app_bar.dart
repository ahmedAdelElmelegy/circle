import 'package:circle/core/di/injection.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/cart/presentation/view_model/shared_prefrence_provider.dart';
import 'package:circle/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:circle/features/home/presentation/view/widgets/app_bar_icon.dart';
import 'package:circle/features/notifications/presentation/view/notification_screen.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SharedPrefrenceProvider sharedProvider = getIt();
    return Consumer<SharedPrefrenceProvider>(
        builder: (context, provider, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SizedBox(
          width: double.infinity,
          height: 72.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgIcon(
                AppIcons.hellow,
                width: 32.w,
                height: 22.h,
              ),
              horizontalSpace(8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'hello',
                    style: TextStyles.font12MadaRegularGray,
                  ).tr(),
                  Text(
                    saveUserData.getUserData()?.firstName ?? 'name'.tr(),
                    style: TextStyles.font16MadaSemiBoldBlack,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, NotificationScreen.routeName);
                },
                child: AppBarIcon(
                  text: 0,
                  icon: AppIcons.notificationIcon,
                ),
              ),
              horizontalSpace(8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: AppBarIcon(
                  text: sharedProvider.cartItems.length,
                  icon: AppIcons.cartIcon,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
