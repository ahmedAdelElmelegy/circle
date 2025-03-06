import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/city_model/city_model.dart';
import 'package:circletraning/data/repository/city_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CityProvider with ChangeNotifier {
  List<CityModel> cityList = [];
  final CityRepo cityRepo;
  GetCityModel? getCityModel;
  bool isLoading = false;
  bool isError = false;

  CityProvider(this.cityRepo);
  Future<ApiResponse> getCity() async {
    cityList.clear();
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await cityRepo.getCity();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      getCityModel = GetCityModel.fromJson(apiResponse.response!.data);
      if (getCityModel!.code == 200) {
        cityList.addAll(getCityModel!.data!);
      } else {
        Fluttertoast.showToast(msg: getCityModel!.message!);
      }
    }
    isError = true;
    notifyListeners();
    return apiResponse;
  }
}
