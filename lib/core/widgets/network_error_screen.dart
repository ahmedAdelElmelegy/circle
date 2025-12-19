import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorScreen extends StatelessWidget {
  final String message;
  final Function() onTryAgain;
  final bool isNetworkError;
  const CustomErrorScreen(
      {super.key,
      required this.message,
      required this.onTryAgain,
      this.isNetworkError = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isNetworkError ? Icons.wifi_off : Icons.error,
              color: Colors.redAccent,
              size: 100,
            ),
            verticalSpace(50),
            Text(
              message,
              style: TextStyles.font16MadaSemiBoldBlack,
            ),
            verticalSpace(30),
            SizedBox(
              width: 250.w,
              height: 45.h,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManger.primary,
                  ),
                  onPressed: onTryAgain,
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: Text(
                    'try_again'.tr(),
                    style: TextStyles.font14MadaRegularWith,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
