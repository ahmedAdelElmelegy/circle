import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/custom_button.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/home/ui/widget/check_box_city.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoseCityBottomSheet extends StatelessWidget {
  const ChoseCityBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.r),
            topRight: Radius.circular(36.r),
          ),
          color: ColorManger.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'governorate',
                    style: TextStyles.font18MadaSemiBoldBlack,
                  ).tr(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgIcon(
                      AppIcons.closeIcon,
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              const CheckBoxCity(),
              verticalSpace(16),
              CustomButton(
                onTap: () {},
                title: 'confirm',
              )
            ],
          ),
        ),
      ),
    );
  }
}
