import 'package:circletraning/data/api_url/api_utls.dart';
import 'package:circletraning/data/data_source/remote/dio/api_services.dart';
import 'package:circletraning/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class FavoriteRepo {
  final ApiService apiService;

  FavoriteRepo(this.apiService);
  Future<ApiResponse> getFavorite() async {
    try {
      Response response = await apiService.get(endpoint: AppURL.fevoriteItem);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
