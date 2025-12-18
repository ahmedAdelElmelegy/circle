import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/features/points/presentation/view_model/points_provider.dart';
import 'package:circle/features/points/presentation/view/widgets/invite_friend_bottom_sheet.dart';
import 'package:circle/features/points/presentation/view/widgets/point_list_view.dart';
import 'package:circle/features/points/presentation/view/widgets/point_number.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PointsProvider>(context, listen: false).getPoints();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: customAppBar('points', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Consumer<PointsProvider>(builder: (context, provider, child) {
            return Column(
              children: [
                PointNumber(
                  pointNumber: provider.points.toString(),
                ),
                CustomButton(
                    width: 203.w,
                    onTap: () {
                      defaultBottomSheet(context,
                          child: const InviteFriendBottomSheet());
                    },
                    title: 'invite_friend'),
                PointListView(
                  provider: provider,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
