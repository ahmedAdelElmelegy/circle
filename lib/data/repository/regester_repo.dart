import 'package:circletraning/data/api_url/api_.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/body/regester_request_body.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class RegesterRepo {
  final ApiServices apiServices;
  RegesterRepo(this.apiServices);
  Future<ApiResponse> regester(RegesterRequestBody requestBody) async {
    try {
      Response response =
          await apiServices.post(ApiURl.register, data: requestBody.tojson());
      return ApiResponse.withSucess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.getMessage(
          e.toString(),
        ),
      );
    }
  }
}
