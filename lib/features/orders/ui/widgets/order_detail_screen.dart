import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/orders/ui/widgets/order_information_section.dart';
import 'package:circletraning/features/orders/ui/widgets/order_product_section.dart';
import 'package:circletraning/features/orders/ui/widgets/order_request_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('order_details', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              const OrderStatusSection(),
              verticalSpace(12),
              const OrderInformationSection(),
              const OrderProductSection(),
              verticalSpace(25),
            ],
          ),
        ),
      ),
    );
  }
}
