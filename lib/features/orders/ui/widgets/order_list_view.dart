import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:circletraning/data/provider/order_provider.dart';
import 'package:circletraning/features/orders/ui/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

OrderProvider orderProvider = getIt();

class OrderListView extends StatefulWidget {
  const OrderListView({
    super.key,
  });

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).getOrder();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, provider, child) {
      if (provider.isFailure) {
        return CustomErrorWidget(
            errMessage: provider.serverFailure!.errMessage);
      }
      if (provider.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => OrderItem(
                orderData: provider.orderData[index],
                orderProvider: provider,
              ),
          itemCount: provider.orderData.length);
    });
  }
}
