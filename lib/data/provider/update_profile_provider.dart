import 'package:circle/core/error/failure.dart';
import 'package:circle/data/models/body/update_profile_request_body.dart';
import 'package:circle/data/models/response/auth_model/auth_model.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/repository/save_user_data.dart';
import 'package:circle/data/repository/update_profile_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateProfileProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  SaveUserData saveUserData;

  AuthModel? authModel;
  ServerFailure? serverFailure;
  UpdateProfileRepo updateProfileRepo;
  UpdateProfileProvider(this.updateProfileRepo, this.saveUserData);

  Future<ApiResponse> updateProfile(
      UpdateProfileRequestBody responseBody) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse =
        await updateProfileRepo.updateProfile(responseBody);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      authModel = AuthModel.fromJson(apiResponse.response!.data);
      if (authModel!.code == 200) {
        saveUserData.saveUserData(authModel!);
        saveUserData.saveUserToken(authModel!.data!.auth!.token!);
        saveUserData.getUserData();

        Fluttertoast.showToast(msg: 'update_profile_success'.tr());
      } else if (authModel!.code == 422) {
        Fluttertoast.showToast(msg: apiResponse.response!.data['message']);
      }
    } else {
      isLoading = false;
      isFailure = true;
      Fluttertoast.showToast(msg: apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
