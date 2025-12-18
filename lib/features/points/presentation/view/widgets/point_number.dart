import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointNumber extends StatelessWidget {
  final String pointNumber;
  const PointNumber({
    super.key,
    required this.pointNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 240.w,
      height: 240.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.pointsGIF),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon(
                AppIcons.pointsIcon,
                width: 32,
                height: 32,
              ),
              horizontalSpace(8),
              Text(
                'my_points'.tr(),
                style: TextStyles.font16MadaSemiBoldBlack
                    .copyWith(color: ColorManger.gray),
              ),
            ],
          ),
          Text(pointNumber,
              style: TextStyles.font24MadaSemiBoldRed.copyWith(
                color: ColorManger.black,
                fontSize: 60.sp,
              ))
        ],
      ),
    );
  }
}
