import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final double? width;
  final bool? isSelect;
  final Widget? child;

  const CustomButton({
    super.key,
    this.child,
    this.title,
    this.onTap,
    this.width,
    this.isSelect = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                isSelect == true ? ColorManger.red : ColorManger.grayLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            minimumSize: Size(width ?? double.infinity, 45.h)),
        onPressed: onTap,
        child: child ??
            Text(title ?? '',
                    style: isSelect == true
                        ? TextStyles.font14MadaRegularWith
                        : TextStyles.font14MadaRegularBlack
                            .copyWith(color: ColorManger.gray))
                .tr());
  }
}
