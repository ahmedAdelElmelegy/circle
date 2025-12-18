import 'dart:convert';

import 'package:circle/features/products/data/models/product_model/product_model_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceProvider with ChangeNotifier {
  List<ProductModelData> cartItems = [];
  // get total price from cartItems
  // get total product price from product list  in list by weight unite and price
  double totalPrice() {
    double total = 0;
    for (var price in cartItems) {
      total += price.price! * price.weightUnit!;
    }
    return total;
  }

  num totalProductPrice(ProductModelData product) {
    return product.weightUnit! * product.price!;
  }

  bool isProductInCart(ProductModelData product) {
    bool isInCart = cartItems.any((item) => item.id == product.id);
    return isInCart;
  }

  double totalQuantity() {
    double total = 0;
    for (var item in cartItems) {
      total += item.weightUnit!;
    }
    return total;
  }

  num productAmount(ProductModelData product) {
    return product.weightUnit!;
  }

  Future<void> saveCartItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(cartItems.map((e) => e.toJson()).toList());
    await sharedPreferences.setString('cartItems', jsonData);
    notifyListeners();
  }

  Future<void> loadCartItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String jsonData = sharedPreferences.getString('cartItems') ?? '[]';

    List<dynamic> data = jsonDecode(jsonData);
    cartItems = data.map((e) => ProductModelData.fromJson(e)).toList();
    notifyListeners();
  }

  void addToCart(ProductModelData product, BuildContext context,
      {bool fromHome = false}) async {
    await loadCartItem();
    bool check = false;
    for (var item in cartItems) {
      if (item.id == product.id) {
        check = true;
        if (fromHome) {
          item.weightUnit = item.weightUnit! + 1;
        } else {
          item.weightUnit = item.weightUnit! + product.weightUnit!;
        }
        saveCartItem();
        notifyListeners();
        // ignore: use_build_context_synchronously
        Fluttertoast.showToast(msg: 'Product_is_already_in_the_cart'.tr());
        return;
      }
    }
    if (!check) {
      cartItems.add(product);
      saveCartItem();
      notifyListeners();
      // ignore: use_build_context_synchronously
      Fluttertoast.showToast(msg: 'product add to cart successfully'.tr());
    }
  }

  void increaseQuantity(ProductModelData product) {
    final index = cartItems.indexOf(product);
    if (index != -1) {
      cartItems[index].weightUnit = cartItems[index].weightUnit! + 1;
      saveCartItem();
      notifyListeners();
    }
  }

  void decreamentQuantity(ProductModelData product) {
    final index = cartItems.indexOf(product);
    if (index != -1 && cartItems[index].weightUnit! > 1) {
      cartItems[index].weightUnit = cartItems[index].weightUnit! - 1;
      saveCartItem();
      notifyListeners();
    }
  }

  void removeFromCart(ProductModelData product) {
    cartItems.remove(product);
    saveCartItem();
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    saveCartItem();
    notifyListeners();
  }
}
