import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';

import 'package:circle/features/cart/ui/widget/cart_item.dart';
import 'package:circle/features/cart/ui/widget/empty_cart.dart';
import 'package:circle/features/pay_and_delevary/ui/pay_and_delevary.dart';
import 'package:circle/features/product_details/ui/product_detail_screen.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SharedPrefrenceProvider>(context, listen: false)
          .loadCartItem();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedPrefrenceProvider>(
        builder: (context, provider, child) {
      if (provider.cartItems.isEmpty) {
        return EmptyWidget(
            title: 'cart_is_empty',
            subtitle: 'looks_like_you_dont_have_anything_in_your_cart',
            image: Assets.emptyCart);
      }
      return Scaffold(
        appBar: customAppBar('cart', context),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: ListView.separated(
              itemBuilder: (context, index) => CartItem(
                increamentQuantity: () {
                  provider.increaseQuantity(provider.cartItems[index]);
                },
                decreamentQuantity: () {
                  provider.decreamentQuantity(provider.cartItems[index]);
                },
                deleteProduct: () {
                  provider.removeFromCart(provider.cartItems[index]);
                },
                product: provider.cartItems[index],
                totalProductPrice:
                    provider.totalProductPrice(provider.cartItems[index]),
              ),
              itemCount: provider.cartItems.length,
              separatorBuilder: (context, index) => const Divider(),
            )),
        bottomSheet: BottomSheetWidget(
          totalPrice: provider.totalPrice().toString(),
          buttonText: 'order_now',
          onTap: () {
            if (saveUserData.getUserToken() == '') {
              Fluttertoast.showToast(msg: 'please_login_first'.tr());
            } else {
              if (provider.cartItems.isEmpty) {
                Fluttertoast.showToast(msg: 'cart_is_empty'.tr());
              } else {
                push(PayAndDelevary(
                  sharedProvider: provider,
                  totalPrice: provider.totalPrice(),
                ));
              }
            }
          },
        ),
      );
    });
  }
}
