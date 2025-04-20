import 'package:circletraning/data/api_url/api_utls.dart';
import 'package:circletraning/data/data_source/remote/dio/api_services.dart';
import 'package:circletraning/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circletraning/data/models/body/login_response_body.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);
  Future<ApiResponse> login(LoginResponseBody loginbody) async {
    try {
      Response response =
          await apiService.post(AppURL.login, data: loginbody.toJson());

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
