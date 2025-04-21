import 'package:circle/data/api_url/api_utls.dart';
import 'package:circle/data/data_source/remote/dio/api_services.dart';
import 'package:circle/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/data/models/body/signup_response_body.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo(this.apiService);
  Future<ApiResponse> signUp(SignupResponseBody responseBody) async {
    try {
      FormData formData = FormData.fromMap({
        "first_name": responseBody.firstName,
        "last_name": responseBody.lastName,
        "phone_code": responseBody.phoneCode,
        "phone": responseBody.phone,
        "image": responseBody.image == null
            ? null
            : await MultipartFile.fromFile(responseBody.image!.path),
        "invitation_code": responseBody.inviteCode,
        "city_id": responseBody.cityId,
      });
      Response response =
          await apiService.post(AppURL.register, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
