import 'package:circle/core/di/injection.dart';
import 'package:circle/core/error/failure.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/data/models/body/calculate_order_cost/product_details.dart';
import 'package:circle/data/models/body/calculate_order_cost/calculate_order_cost.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/calculate_order_cost_model/calculate_order_cost_model.dart';
import 'package:circle/data/models/response/calculate_order_cost_model/calculate_order_data.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';
import 'package:circle/data/repository/calculate_order_cost_repo.dart';
import 'package:circle/features/pay_and_delevary/ui/pay_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CalculateOrderCostProvider with ChangeNotifier {
  CalculateOrderCostModel? calculateOrderCostModel;
  CalculateOrderData? calculateOrderData;
  CalculateOrderCostRepo calculateOrderCostRepo;
  bool usePoint = true;
  String payType = 'cash';
  List<Productdetails>? detail = [];
  SharedPrefrenceProvider shared = getIt();
  CalculateOrderCostProvider(this.calculateOrderCostRepo);
  Position? position;
  String fullAddress = 'please_select_your_location'.tr();
  TextEditingController noteController = TextEditingController();
  bool isLoading = false;
  bool isFailure = false;
  ServerFailure? serverFailure;

  Future<ApiResponse> calculateOrderCost(
      CalculateOrderCost calculateOrderCost) async {
    for (int i = 0; i < shared.cartItems.length; i++) {
      num id = shared.cartItems[i].id!;
      num quantity = shared.cartItems[i].weightUnit!;
      detail!.add(Productdetails(
          productId: id.toInt(), qty: quantity.toInt(), netCost: 0));
    }
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse =
        await calculateOrderCostRepo.calculateOrderCost(calculateOrderCost);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      calculateOrderCostModel =
          CalculateOrderCostModel.fromJson(apiResponse.response!.data);

      if (calculateOrderCostModel!.code == 200) {
        calculateOrderData = calculateOrderCostModel!.data!;
        push(const PayScreen());
      } else if (calculateOrderCostModel!.code == 422) {
        Fluttertoast.showToast(msg: calculateOrderCostModel!.message!);
      }
    } else {
      isFailure = true;
      Fluttertoast.showToast(msg: apiResponse.error);

      serverFailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }

  Future<void> getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        fullAddress =
            '${place.locality}, ${place.administrativeArea}, ${place.country}';
        notifyListeners();

        pop();
      } else {
        Fluttertoast.showToast(msg: 'no_address_found'.tr());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setUpPaymentType(String type) async {
    payType = type;

    notifyListeners();
  }
}
