import 'package:circletraning/core/helpers/app_method.dart';

import 'package:circletraning/features/cart/ui/widget/cart_item.dart';
import 'package:circletraning/features/invoice/ui/invoice_screen.dart';
import 'package:circletraning/features/product_details/ui/product_detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('cart', context),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: ListView.separated(
            itemBuilder: (context, index) => const CartItem(),
            itemCount: 10,
            separatorBuilder: (context, index) => const Divider(),
          )),
      bottomSheet: BottomSheetWidget(
        totalPrice: 250,
        buttonText: 'order_now',
        onTap: () {
          Navigator.pushNamed(context, InvoiceScreen.routeName);
        },
      ),
    );
  }
}
