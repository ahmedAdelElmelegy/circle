import 'package:circle/core/network/api_url/api_utls.dart';
import 'package:circle/core/network/data_source/remote/dio/api_services.dart';
import 'package:circle/core/network/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class LatestProductRepo {
  final ApiService apiService;

  LatestProductRepo(this.apiService);

  Future<ApiResponse> getLatestProduct() async {
    try {
      Response response = await apiService.get(
          endpoint: AppURL.lastProduct); //AppURL.latestProduct

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiError2Handler.handleError(e));
    }
  }
}
