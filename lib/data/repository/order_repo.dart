import 'package:circle/data/api_url/api_utls.dart';
import 'package:circle/data/data_source/remote/dio/api_services.dart';
import 'package:circle/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class OrderRepo {
  final ApiService apiService;
  OrderRepo(this.apiService);
  Future<ApiResponse> getOrder(Map<String, dynamic> query) async {
    try {
      Response response =
          await apiService.get(endpoint: AppURL.myOrders, query: query);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
