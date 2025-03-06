import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/custom_button.dart';
import 'package:circletraning/features/points/ui/widgets/invite_friend_bottom_sheet.dart';
import 'package:circletraning/features/points/ui/widgets/point_list_title.dart';
import 'package:circletraning/features/points/ui/widgets/point_number.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsScreen extends StatelessWidget {
  static const routeName = '/points';
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: customAppBar('points', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const PointNumber(),
              CustomButton(
                  width: 203.w,
                  onTap: () {
                    defaultBottomSheet(context,
                        child: const InviteFriendBottomSheet());
                  },
                  title: 'invite_friend'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'registery'.tr(),
                        style: TextStyles.font12MadaRegularGray,
                      ),
                      verticalSpace(12),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return PointListTitle(
                              subTitle: 'ahmed_adel'.tr(),
                            );
                          }),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
