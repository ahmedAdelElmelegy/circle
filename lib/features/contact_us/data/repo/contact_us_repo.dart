import 'package:circle/core/network/api_url/api_utls.dart';
import 'package:circle/core/network/data_source/remote/dio/api_services.dart';
import 'package:circle/core/network/data_source/remote/exception/api_error_handeler.dart';
import 'package:circle/features/contact_us/data/models/body/contact_us_request_body.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:dio/dio.dart';

class ContactUsRepo {
  final ApiService apiService;

  ContactUsRepo(this.apiService);
  Future<ApiResponse> contactUs(ContactUsRequestBody contactBody) async {
    try {
      Response response =
          await apiService.post(AppURL.contactUs, data: contactBody.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
