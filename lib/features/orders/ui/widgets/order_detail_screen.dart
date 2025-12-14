import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/data/models/response/order_model/order_data.dart';
import 'package:circle/data/provider/cancel_order_provider.dart';
import 'package:circle/features/orders/ui/widgets/order_information_section.dart';
import 'package:circle/features/orders/ui/widgets/order_product_section.dart';
import 'package:circle/features/orders/ui/widgets/order_request_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderData orderData;
  const OrderDetailScreen({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CancelOrderProvider>(context);

    return Scaffold(
      appBar: customAppBar('order_details', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              OrderStatusSection(
                onPress: () {
                  provider.cancelOrder(orderData.id!.toInt());
                },
              ),
              verticalSpace(12),
              OrderInformationSection(
                orderData: orderData,
              ),
              verticalSpace(12),
              OrderProductSection(
                orderData: orderData,
              ),
              verticalSpace(25),
            ],
          ),
        ),
      ),
    );
  }
}
