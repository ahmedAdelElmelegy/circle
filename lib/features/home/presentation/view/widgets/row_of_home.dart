import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowOfHome extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const RowOfHome({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyles.font18MadaSemiBoldBlack,
          ).tr(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'view_all',
              style: TextStyles.font12MadaRegularRed,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
