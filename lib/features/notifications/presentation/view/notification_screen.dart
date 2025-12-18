import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/features/notifications/presentation/view/widgets/notification_list_view.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notifications';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('notification', context),
      body: const NotificationGridView(),
    );
  }
}
