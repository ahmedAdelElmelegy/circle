import 'package:circle/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customShowSnackBar(
    BuildContext context, bool check) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Product is ${check ? 'inCart' : 'added'} in the cart',
          style: TextStyles.font14MadaRegularWith,
        ),
      ),
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      margin: EdgeInsets.only(
        // ignore: use_build_context_synchronously
        bottom: MediaQuery.of(context).size.height - 180.h,
        left: 50.w,
        right: 50.w,
      ),
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
    ),
  );
}
