import 'package:circle/core/error/failure.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/payment_model/payment_data.dart';
import 'package:circle/data/models/response/payment_model/payment_model.dart';
import 'package:circle/data/repository/payment_repo.dart';
import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  bool isloading = false;
  bool isFailure = false;
  PaymentModel? paymentModel;
  PaymentData? paymentData;
  PaymentRepo paymentRepo;
  ServerFailure? serverFailure;

  PaymentProvider(this.paymentRepo);

  Future<ApiResponse> getPayment() async {
    isloading = true;
    notifyListeners();
    ApiResponse apiResponse = await paymentRepo.getPayment();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      paymentModel = PaymentModel.fromJson(apiResponse.response!.data);
      if (paymentModel!.code == 200) {
        paymentData = paymentModel!.data!;
      }
    } else {
      isFailure = true;
      serverFailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isloading = false;
    notifyListeners();
    return apiResponse;
  }
}
