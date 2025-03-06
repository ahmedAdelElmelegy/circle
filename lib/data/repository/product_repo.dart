import 'package:circletraning/data/api_url/api_.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';

class ProductRepo {
  ApiServices apiServices;
  ProductRepo(this.apiServices);

  Future<ApiResponse> getProduct({Map<String, dynamic>? query}) async {
    try {
      final response =
          await apiServices.get(endpoint: ApiURl.product, query: query);
      return ApiResponse.withSucess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
