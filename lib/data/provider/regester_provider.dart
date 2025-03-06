import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/body/regester_request_body.dart';
import 'package:circletraning/data/models/response/auth_model/auth_model.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/repository/regester_repo.dart';
import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:flutter/material.dart';

class RegesterProvider with ChangeNotifier {
  final RegesterRepo regesterRepo;
  final SaveUserData saveUserData;

  RegesterProvider(this.regesterRepo, this.saveUserData);

  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController inviteCodeController = TextEditingController();

  final firstNameFormField = GlobalKey<FormState>();
  final lastNameFormField = GlobalKey<FormState>();
  final phoneFormField = GlobalKey<FormState>();
  final cityFormField = GlobalKey<FormState>();
  int cityId = 0;

  bool isLoading = false;
  bool isFailure = false;
  ApiErrorHandler? apiErrorHandler;
  AuthModel? regesterBody;
  Future<ApiResponse> regester(RegesterRequestBody body) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await regesterRepo.regester(body);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      regesterBody = AuthModel.fromJson(apiResponse.response!.data);
      if (regesterBody!.data!.user!.id != null) {
        saveUserData.saveUserData(regesterBody!);

        saveUserData.saveUserToken(regesterBody?.data?.auth?.token ?? '');
        phoneController.clear();
        firstNameController.clear();
        lastNameController.clear();
        inviteCodeController.clear();
        cityId = 0;

        pushAndRemoveUntil(const MainScreen());
      }
    } else {
      isFailure = true;
      notifyListeners();
      apiErrorHandler = ApiErrorHandler.getMessage(apiResponse.error);
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
