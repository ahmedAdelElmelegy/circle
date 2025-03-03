import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapButtomSheet extends StatelessWidget {
  const MapButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our_branches'.tr(),
              style: TextStyles.font16MadaSemiBoldBlack
                  .copyWith(color: ColorManger.gray),
            ),
            verticalSpace(16),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const BranshItem();
                }),
          ],
        ),
      ),
    );
  }
}

class BranshItem extends StatelessWidget {
  const BranshItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgIcon(
                AppIcons.locationIcon,
                width: 20.w,
                height: 20.h,
              ),
              horizontalSpace(10),
              Text(
                'branch1'.tr(),
                style: TextStyles.font14MadaRegularBlack,
              ),
            ],
          ),
          Text('930 ${tr('meter')}',
              style: TextStyles.font12MadaRegularGray
                  .copyWith(color: ColorManger.gray)),
        ],
      ),
    );
  }
}
