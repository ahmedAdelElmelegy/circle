import 'package:circletraning/data/api_url/api_.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/body/login_request_body.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final ApiServices apiServices;
  final SaveUserData saveUserData;
  LoginRepo(this.apiServices, this.saveUserData);

  Future<ApiResponse> login(LoginRequestBody requestBody) async {
    try {
      Response response = await apiServices.post(
        ApiURl.login,
        data: requestBody.tojson(),
      );
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
