import 'package:circle/core/error/failure.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/features/orders/data/models/response/order_model/order_data.dart';
import 'package:circle/features/orders/data/models/response/order_model/order_model.dart';
import 'package:circle/features/orders/data/repo/order_repo.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  int currentIndex = 0;
  ServerFailure? serverFailure;
  void statusOfOrder(int index) {
    currentIndex = index;
    getOrder();
    notifyListeners();
  }

  bool loading = false;
  bool isFailure = false;
  List<OrderData> orderData = [];
  OrderModel? orderModel;
  OrderRepo orderRepo;
  OrderProvider(this.orderRepo);
  Future<ApiResponse> getOrder() async {
    loading = true;
    notifyListeners();
    ApiResponse apiResponse = await orderRepo.getOrder(
      currentIndex == 0 ? {'type': 'new'} : {'status': 'old'},
    );
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      orderModel = OrderModel.fromJson(apiResponse.response!.data);
      orderData.clear();
      if (orderModel!.code == 200) {
        orderData.addAll(orderModel!.data!);
      }
    } else {
      isFailure = true;

      serverFailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    loading = false;
    notifyListeners();
    return apiResponse;
  }
}
