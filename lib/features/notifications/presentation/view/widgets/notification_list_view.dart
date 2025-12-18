import 'package:circle/features/notifications/presentation/view/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationGridView extends StatelessWidget {
  const NotificationGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => const NotificationItem(),
          itemCount: 10),
    );
  }
}
