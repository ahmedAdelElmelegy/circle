import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/features/main_screen.dart';
import 'package:circle/features/orders/presentation/view/widgets/order_btns.dart';
import 'package:circle/features/orders/presentation/view/widgets/order_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWithNavigation(
        'my_orders',
        () {
          push(const MainScreen());
        },
        context,
      ),
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
