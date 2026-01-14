import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;
  final VoidCallback? onRetry;
  final IconData? icon;

  const CustomErrorWidget({
    super.key,
    required this.errMessage,
    this.onRetry,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_outline_rounded,
              color: ColorManger.red,
              size: isTablet ? 80.sp : 60.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              "Oops!",
              style: isTablet
                  ? TextStyles.font24MadaSemiBoldBlack
                  : TextStyles.font18MadaSemiBoldBlack,
            ),
            SizedBox(height: 8.h),
            Text(
              errMessage,
              style: isTablet
                  ? TextStyles.font18MadaRegularBlack
                  : TextStyles.font14MadaRegularBlack,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 24.h),
              SizedBox(
                width: isTablet ? 200.w : double.infinity,
                child: ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManger.primary,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "Try Again",
                    style: TextStyles.font14MadaSemiBoldWhite,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
