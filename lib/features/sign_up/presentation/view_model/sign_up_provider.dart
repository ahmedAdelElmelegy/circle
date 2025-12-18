import 'package:circle/core/error/failure.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/features/sign_up/data/models/signup_response_body.dart';
import 'package:circle/features/login/data/models/response/auth_model/auth_model.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/features/sign_up/data/repo/save_user_data.dart';
import 'package:circle/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:circle/features/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  SaveUserData saveUserData;

  AuthModel? authModel;
  ServerFailure? serverFailure;
  SignUpRepo signUpRepo;
  SignUpProvider(this.signUpRepo, this.saveUserData);

  final phoneKey = GlobalKey<FormState>();
  final firstNameKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  final cityKey = GlobalKey<FormState>();
  final invityCodeKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController inviteCode = TextEditingController();
  Future<ApiResponse> signUp(SignupResponseBody responseBody) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await signUpRepo.signUp(responseBody);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      authModel = AuthModel.fromJson(apiResponse.response!.data);
      if (authModel!.code == 200) {
        saveUserData.saveUserData(authModel!);
        saveUserData.saveUserToken(authModel!.data!.auth!.token!);
        phone.clear();
        firstName.clear();
        lastName.clear();
        inviteCode.clear();
        Fluttertoast.showToast(msg: 'sign_up_successfully'.tr());
        pushAndRemoveUntil(const MainScreen());
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
