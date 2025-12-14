import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapButtomSheet extends StatelessWidget {
  final List<Map<String, dynamic>> branches;
  const MapButtomSheet({super.key, required this.branches});

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
                itemCount: branches.length,
                itemBuilder: (context, index) {
                  return BranshItem(
                    city: branches[index]['name'],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class BranshItem extends StatelessWidget {
  final String city;
  const BranshItem({super.key, required this.city});

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
                city,
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
