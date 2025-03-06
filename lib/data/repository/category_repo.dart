import 'package:circletraning/data/api_url/api_.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class CategoryRepo {
  ApiServices apiServices;
  CategoryRepo(this.apiServices);
  Future<ApiResponse> getCategory() async {
    try {
      Response apiResponse = await apiServices.get(endpoint: ApiURl.category);

      return ApiResponse.withSucess(apiResponse);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e.toString()));
    }
  }
}
