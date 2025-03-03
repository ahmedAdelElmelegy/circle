import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointListTitle extends StatelessWidget {
  final String subTitle;

  const PointListTitle({
    super.key,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SvgIcon(AppIcons.pointsIcon),
          horizontalSpace(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'invite_friend'.tr(),
                style: TextStyles.font10MadaRegularBlack
                    .copyWith(color: ColorManger.gray),
              ),
              verticalSpace(4),
              Text(
                subTitle,
                style: TextStyles.font14MadaSemiBoldBlack,
              )
            ],
          ),
          const Spacer(),
          Text('+ 10',
              style: TextStyles.font18MadaSemiBoldBlack.copyWith(
                color: ColorManger.red,
              ))
        ],
      ),
    );
  }
}
