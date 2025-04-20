import 'package:circle/data/api_url/api_utls.dart';
import 'package:circle/data/data_source/remote/dio/api_services.dart';
import 'package:circle/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/data/models/body/calculate_order_cost/calculate_order_cost.dart';
import 'package:circle/data/models/response/base/api_response.dart';
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
