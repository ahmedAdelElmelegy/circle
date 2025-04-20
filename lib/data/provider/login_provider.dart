import 'package:circle/core/di/injection.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/data/models/body/login_response_body.dart';
import 'package:circle/data/models/response/auth_model/auth_model.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/provider/sign_up_provider.dart';
import 'package:circle/data/repository/login_repo.dart';
import 'package:circle/data/repository/save_user_data.dart';
import 'package:circle/features/main_screen.dart';
import 'package:circle/features/sign_up/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  String apiErrorHandler = '';
  AuthModel? authModel;
  SignUpProvider signUpProvider = getIt();
  final formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  final SaveUserData saveUserData;
  final LoginRepo loginRepo;

  LoginProvider(this.saveUserData, this.loginRepo);
  Future<ApiResponse> login(LoginResponseBody loginbody) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await loginRepo.login(loginbody);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      authModel = AuthModel.fromJson(apiResponse.response!.data);
      if (authModel!.code == 200) {
        saveUserData.saveUserData(authModel!);
        saveUserData.saveUserToken(authModel!.data!.auth!.token!);
        phone.clear();
        pushAndRemoveUntil(const MainScreen());
      } else if (authModel!.code == 422) {
        Fluttertoast.showToast(msg: apiResponse.response!.data['message']);

        signUpProvider.phone.text = phone.text;
        pushReplacement(const SignUp());
      }
    } else {
      isFailure = true;
      Fluttertoast.showToast(msg: apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
