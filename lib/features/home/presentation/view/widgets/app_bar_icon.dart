import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/svg_icon.dart';

class AppBarIcon extends StatelessWidget {
  final String icon;
  final int? text;

  const AppBarIcon({
    super.key,
    required this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorManger.grayLight),
      width: 48.w,
      height: 48.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgIcon(icon),
          ),
          text != null && text != 0
              ? Positioned(
                  right: 5.w,
                  top: 2.h,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManger.white, width: 1),
                      color: ColorManger.red,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        text!.toString(),
                        style: TextStyles.font10MadaRegularBlack
                            .copyWith(color: ColorManger.white),
                      ),
                    )),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}
