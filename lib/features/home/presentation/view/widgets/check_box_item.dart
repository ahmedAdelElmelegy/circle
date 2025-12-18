import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxItem extends StatelessWidget {
  final bool? isActive;
  final String cityName;
  const CheckBoxItem(
      {super.key, this.isActive = false, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            onChanged: (value) {},
            value: isActive,
            checkColor: ColorManger.red,
            side: const BorderSide(color: ColorManger.red, width: 2),
            activeColor: ColorManger.red,
            shape: const CircleBorder(
                side: BorderSide(color: ColorManger.red, width: 2)),
          ),
          Text(
            cityName,
            style: TextStyles.font14MadaRegularBlack,
          ).tr(),
        ],
      ),
    );
  }
}
