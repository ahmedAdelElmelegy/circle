import 'package:circletraning/data/api_url/api_.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';

class LatestProductRepo {
  ApiServices apiServices;
  LatestProductRepo(this.apiServices);

  Future<ApiResponse> getLatestProduct() async {
    try {
      final response = await apiServices.get(endpoint: ApiURl.lastProduct);
      return ApiResponse.withSucess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }
}
