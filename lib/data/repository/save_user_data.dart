import 'dart:convert';

import 'package:circletraning/core/utils/app_constants.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/models/response/auth_model/auth_model.dart';
import 'package:circletraning/data/models/response/auth_model/user.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUserData {
  final SharedPreferences sharedPreferences;
  final ApiServices apiServices;
  SaveUserData(this.sharedPreferences, this.apiServices);
  Future<void> saveUserData(AuthModel loginBody) async {
    String userSavedData = json.encode(loginBody.data!.user);
    try {
      await sharedPreferences.setString(AppConstants.userData, userSavedData);
    } catch (e) {
      rethrow;
    }
    apiServices.updataHeader(
      token: loginBody.data!.auth!.token,
    );
  }

  Future<void> saveUserToken(String userTOKEN) async {
    apiServices.updataHeader(token: userTOKEN);
    try {
      await sharedPreferences.setString(AppConstants.userTOKEN, userTOKEN);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveLang(String lang) async {
    try {
      await sharedPreferences.setString(AppConstants.lang, lang);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveTitle(String title) async {
    try {
      await sharedPreferences.setString(AppConstants.title, title);
    } catch (e) {
      rethrow;
    }
  }

  // get user data
  UserData? getUserData() {
    String? userSavedData = sharedPreferences.getString(AppConstants.userData);
    if (userSavedData != null) {
      Map<String, dynamic> userData = json.decode(userSavedData);
      UserData userModel = UserData.fromJson(userData);
      return userModel;
    }
    return null;
  }

  String getLang() {
    String lang = sharedPreferences.getString(AppConstants.lang) ?? '';
    return lang;
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
  }

  String getCurrency() {
    return sharedPreferences.getString(AppConstants.currency) ?? "USD";
  }

  String getBranchTitle() {
    return sharedPreferences.getString(AppConstants.title) ?? "";
  }

  bool isSaveBranchId() {
    return sharedPreferences.containsKey(AppConstants.branchId);
  }

  // clear user data
  Future<bool> clearSharedData(BuildContext context) async {
    await sharedPreferences.remove(AppConstants.userData);
    await sharedPreferences.remove(AppConstants.userTOKEN);
    await sharedPreferences.remove(AppConstants.title);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, MainScreen.routeName);
    return true;
  }
}
