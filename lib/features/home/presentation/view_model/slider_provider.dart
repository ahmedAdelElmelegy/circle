import 'package:circle/core/error/failure.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/features/home/data/model/response/slider_model/slider.dart';
import 'package:circle/features/home/data/model/response/slider_model/slider_model.dart';
import 'package:circle/features/home/data/repo/slider_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  SliderModel? sliderModel;
  SliderRepo sliderRepo;
  SliderProvider(this.sliderRepo);
  ServerFailure? serverFailure;
  int notificationCount = 0;
  List<SSlider> sliderList = [];

  Future<ApiResponse> getSlider() async {
    isLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await sliderRepo.getSlider();

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      sliderModel = SliderModel.fromJson(apiResponse.response!.data);
      if (sliderModel!.code == 200) {
        sliderList.addAll(sliderModel!.data!.slider!);
        notificationCount = sliderModel!.data!.notificationCount!;
      }
    } else {
      isFailure = true;
      if (apiResponse.error is DioException) {
        serverFailure = ServerFailure.fromDioError(apiResponse.error);
      } else {
        serverFailure = ServerFailure(apiResponse.error.toString());
      }
      notifyListeners();
    }

    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
