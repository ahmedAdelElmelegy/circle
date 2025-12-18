import 'package:circle/core/network/api_url/api_utls.dart';
import 'package:circle/core/network/data_source/remote/dio/api_services.dart';
import 'package:circle/core/network/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/features/pay_and_delevary/data/models/body/calculate_order_cost.dart';
import 'package:dio/dio.dart';

class CalculateOrderCostRepo {
  final ApiService apiService;

  CalculateOrderCostRepo(this.apiService);
  Future<ApiResponse> calculateOrderCost(
      CalculateOrderCost calculateOrderCost) async {
    try {
      Response response = await apiService.post(AppURL.calculateOrderCost,
          data: calculateOrderCost.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
