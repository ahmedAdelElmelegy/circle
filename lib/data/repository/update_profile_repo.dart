import 'package:circle/data/api_url/api_utls.dart';
import 'package:circle/data/data_source/remote/dio/api_services.dart';
import 'package:circle/data/data_source/remote/exception/api_error_handeler.dart'
    show ApiErrorHandler;
import 'package:circle/data/models/body/update_profile_request_body.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class UpdateProfileRepo {
  final ApiService apiService;

  UpdateProfileRepo(this.apiService);

  Future updateProfile(UpdateProfileRequestBody updateProfile) async {
    try {
      FormData formData = FormData.fromMap({
        "first_name": updateProfile.firstName,
        "last_name": updateProfile.lastName,
        "image": updateProfile.image == null
            ? null
            : await MultipartFile.fromFile(updateProfile.image!.path),
      });
      Response response =
          await apiService.post(AppURL.updateProfile, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
