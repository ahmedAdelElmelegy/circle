import 'package:circletraning/core/error/failure.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/city_model/city_model.dart';
import 'package:circletraning/data/repository/city_repo.dart';
import 'package:flutter/material.dart';

class CityProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  ServerFailure? serverFailure;
  final CityRepo cityRepo;

  CityProvider(this.cityRepo);
  List<CityModel> cityList = [];
  GetCityModel? getCityModel;
  Future<ApiResponse> getCity() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await cityRepo.getCity();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      getCityModel = GetCityModel.fromJson(apiResponse.response!.data);
      if (getCityModel!.code == 200) {
        cityList.addAll(getCityModel!.data!);
      }
    } else {
      isFailure = true;
      serverFailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
