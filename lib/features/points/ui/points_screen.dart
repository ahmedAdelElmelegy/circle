import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/widgets/custom_button.dart';
import 'package:circletraning/data/provider/points_provider.dart';
import 'package:circletraning/features/points/ui/widgets/invite_friend_bottom_sheet.dart';
import 'package:circletraning/features/points/ui/widgets/point_list_view.dart';
import 'package:circletraning/features/points/ui/widgets/point_number.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PointsScreen extends StatefulWidget {
  static const routeName = '/points';
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
