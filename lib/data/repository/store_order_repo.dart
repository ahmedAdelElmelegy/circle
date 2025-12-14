import 'package:circle/data/api_url/api_utls.dart';
import 'package:circle/data/data_source/remote/dio/api_services.dart';
import 'package:circle/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/data/models/body/store_order/store_order.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class StoreOrderRepo {
  final ApiService apiService;

  StoreOrderRepo(this.apiService);
  Future<ApiResponse> storeOrder(StoreOrder storeOrder) async {
    try {
      Response response =
          await apiService.post(AppURL.storeOrder, data: storeOrder.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
