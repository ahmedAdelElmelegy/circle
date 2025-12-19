import 'package:circle/core/network/data_source/remote/exception/app_exeptions.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/features/home/data/model/response/slider_model/slider.dart';
import 'package:circle/features/home/data/model/response/slider_model/slider_model.dart';
import 'package:circle/features/home/data/repo/slider_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  bool isLoading = false;
  // bool isFailure = false;
  SliderModel? sliderModel;
  AppException? _error;
  AppException? get error => _error;

  bool get hasError => _error != null;

  SliderRepo sliderRepo;
  SliderProvider(this.sliderRepo);
  int notificationCount = 0;
  List<SSlider> sliderList = [];

  Future<ApiResponse> getSlider() async {
    isLoading = true;
    _error = null;
    notifyListeners();

    ApiResponse apiResponse = await sliderRepo.getSlider();

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      sliderModel = SliderModel.fromJson(apiResponse.response!.data);
      if (sliderModel!.code == 200) {
        sliderList.clear();
        sliderList.addAll(sliderModel!.data!.slider!);
        notificationCount = sliderModel!.data!.notificationCount!;
      }
    } else {
      if (apiResponse.error is DioException) {
        _error = apiResponse.error;
      } else {
        _error = apiResponse.error;
      }
      notifyListeners();
    }

    isLoading = false;
    notifyListeners();
    return apiResponse;
  }

  bool get isNetworkError => _error is NetworkException;
  bool get isAuthError => _error is AuthenticationException;
  bool get isServerError => _error is ServerException;
  Future<void> retry() => getSlider();
}
