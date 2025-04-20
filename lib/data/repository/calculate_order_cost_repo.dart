import 'package:circletraning/data/api_url/api_utls.dart';
import 'package:circletraning/data/data_source/remote/dio/api_services.dart';
import 'package:circletraning/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circletraning/data/models/body/calculate_order_cost/calculate_order_cost.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
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
