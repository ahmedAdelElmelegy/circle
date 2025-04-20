import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/orders/ui/widgets/order_btns.dart';
import 'package:circletraning/features/orders/ui/widgets/order_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('my_orders', context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              const OrderBtns(),
              verticalSpace(24),
              const OrderListView(),
            ],
          ),
        ),
      ),
    );
  }
}
