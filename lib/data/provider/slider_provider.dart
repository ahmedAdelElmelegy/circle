import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/slider_model/s_slider_model.dart';
import 'package:circletraning/data/models/response/slider_model/slider.dart';
import 'package:circletraning/data/repository/slider_repo.dart';
import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  SliderModel? sliderModel;
  ApiErrorHandler? apiErrorHandler;
  int notificationCount = 0;
  SliderRepo sliderRepo;
  SliderProvider(this.sliderRepo);
  List<Sslider>? sliderList = [];
  Future<ApiResponse> getSlider() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await sliderRepo.getSlider();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      sliderModel = SliderModel.fromJson(apiResponse.response!.data);
      if (sliderModel!.code == 200) {
        notificationCount = sliderModel!.data!.notificationCount!;
        sliderList = sliderModel!.data!.slider;
      }
    } else {
      isFailure = true;
      apiErrorHandler =
          ApiErrorHandler.getMessage(apiResponse.error.toString());
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
