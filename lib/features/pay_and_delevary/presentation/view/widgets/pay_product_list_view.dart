import 'package:circle/features/pay_and_delevary/presentation/view/widgets/pay_product_item.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:flutter/material.dart';

class PayProductListView extends StatelessWidget {
  final CalculateOrderCostProvider provider;
  const PayProductListView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PayProductItem(
          productName: provider.shared.cartItems[index].title!,
          prodcutPrice: provider.shared.cartItems[index].price!.toString(),
          productCount: provider.shared.cartItems[index].weightUnit!.toString(),
        );
      },
      itemCount: provider.shared.cartItems.length,
    );
  }
}
