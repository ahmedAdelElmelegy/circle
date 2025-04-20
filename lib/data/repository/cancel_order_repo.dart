import 'package:circletraning/data/api_url/api_utls.dart';
import 'package:circletraning/data/data_source/remote/dio/api_services.dart';
import 'package:circletraning/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class CancelOrderRepo {
  final ApiService apiService;
  CancelOrderRepo(this.apiService);

  Future<ApiResponse> cancelOrder(int id) async {
    try {
      Response response = await apiService.del(
        '${AppURL.cancelOrder}$id',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
