import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/features/settings/presentation/view/widgets/logout_btn.dart';
import 'package:circle/features/settings/presentation/view/widgets/point_and_favorite_and_order.dart';
import 'package:circle/features/settings/presentation/view/widgets/profile_data.dart';
import 'package:circle/features/settings/presentation/view/widgets/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBarWithoutLeading('more', context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const ProfileData(),
                verticalSpace(8),
                const PointAndFavAndOrder(),
                verticalSpace(12),
                const SettingWidget(),
                verticalSpace(16),
                const LogoutBtn()
              ],
            ),
          ),
        ));
  }
}
