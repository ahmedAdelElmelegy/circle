import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCallPerson extends StatelessWidget {
  const OrderCallPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(10),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.profile,
                          width: 48.w,
                          height: 48.h,
                        ),
                        horizontalSpace(12),
                        Column(
                          children: [
                            Text(
                              'Ahmed_Adel'.tr(),
                              style: TextStyles.font14MadaSemiBoldBlack,
                            ),
                            verticalSpace(4),
                            Text(
                              '01069371116',
                              style: TextStyles.font14MadaRegularBlack
                                  .copyWith(color: ColorManger.gray),
                            )
                          ],
                        ),
                      ],
                    ),
                    SvgIcon(
                      AppIcons.callIcon,
                    )
                  ],
                )))
      ],
    );
  }
}
