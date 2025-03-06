import 'package:circletraning/data/api_url/api_.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';

class CityRepo {
  final ApiServices apiServices;

  CityRepo(this.apiServices);
  Future<ApiResponse> getCity() async {
    try {
      final response = await apiServices.get(endpoint: ApiURl.getCity);
      return ApiResponse.withSucess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
