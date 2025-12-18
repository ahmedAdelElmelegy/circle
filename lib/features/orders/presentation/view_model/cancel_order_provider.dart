import 'package:circle/core/di/injection.dart';
import 'package:circle/core/error/failure.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/core/network/models/response/init_model.dart';
import 'package:circle/features/orders/presentation/view_model/order_provider.dart';
import 'package:circle/features/orders/data/repo/cancel_order_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CancelOrderProvider with ChangeNotifier {
  CancelOrderRepo cancelOrderRepo;
  OrderProvider orderProvider = getIt();
  CancelOrderProvider(this.cancelOrderRepo);
  bool isLoading = false;
  bool isFailure = false;
  ServerFailure? serverFailure;
  InitModel? initModel;
  Future<ApiResponse> cancelOrder(
    int id,
  ) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await cancelOrderRepo.cancelOrder(id);
    if (apiResponse.response != null &&
        apiResponse.response!.data != null &&
        apiResponse.response!.statusCode == 200) {
      initModel = InitModel.fromJson(apiResponse.response!.data);
      if (initModel!.code == 200) {
        Fluttertoast.showToast(msg: 'order_cancel_sucessfully'.tr());
        orderProvider.getOrder();
        pop();
        notifyListeners();
      }
    } else {
      isFailure = true;
      Fluttertoast.showToast(msg: 'Order not cancel');
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
