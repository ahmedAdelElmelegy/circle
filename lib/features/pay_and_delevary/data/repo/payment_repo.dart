import 'package:circle/core/network/api_url/api_utls.dart';
import 'package:circle/core/network/data_source/remote/dio/api_services.dart';
import 'package:circle/core/network/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class PaymentRepo {
  final ApiService apiService;

  PaymentRepo(this.apiService);

  Future<ApiResponse> getPayment() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.payment);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
