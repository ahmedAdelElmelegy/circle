import 'package:circle/data/api_url/api_utls.dart';
import 'package:circle/data/data_source/remote/dio/api_services.dart';
import 'package:circle/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class SliderRepo {
  ApiService apiService;

  SliderRepo(this.apiService);

  Future<ApiResponse> getSlider() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.slider);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
