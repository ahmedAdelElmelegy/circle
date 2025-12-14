import 'dart:convert';

import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/utils/app_constants.dart';
import 'package:circle/data/data_source/remote/dio/api_services.dart';
import 'package:circle/data/models/response/auth_model/auth_model.dart';
import 'package:circle/data/models/response/auth_model/user.dart';
import 'package:circle/features/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUserData {
  final SharedPreferences sharedPreferences;
  final ApiService apiService;

  SaveUserData(this.sharedPreferences, this.apiService);
  Future<void> saveUserData(AuthModel authModel) async {
    try {
      String userSaveData = json.encode(authModel.data!.user);
      sharedPreferences.setString(AppConstants.userData, userSaveData);
    } catch (e) {
      rethrow;
    }
    apiService.updateHeader(token: authModel.data!.auth!.token);
  }

  Future<void> saveUserToken(String userTOKEN) async {
    apiService.updateHeader(token: userTOKEN);
    try {
      await sharedPreferences.setString(AppConstants.userTOKEN, userTOKEN);
    } catch (e) {
      rethrow;
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(
          AppConstants.userTOKEN,
        ) ??
        '';
  }

  UserData? getUserData() {
    String? userSavedData = sharedPreferences.getString(AppConstants.userData);
    if (userSavedData != null) {
      Map<String, dynamic> userData = json.decode(userSavedData);
      UserData userModel = UserData.fromJson(userData);
      return userModel;
    }
    return null;
  }

  Future<void> saveLang(String lang) async {
    try {
      await sharedPreferences.setString(AppConstants.lang, lang);
    } catch (e) {
      rethrow;
    }
  }

  String getLang() {
    return sharedPreferences.getString(
          AppConstants.lang,
        ) ??
        'ar';
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.userData);
    await sharedPreferences.remove(AppConstants.userTOKEN);
    await sharedPreferences.remove(AppConstants.title);
    pushAndRemoveUntil(const MainScreen());

    return true;
  }
}
