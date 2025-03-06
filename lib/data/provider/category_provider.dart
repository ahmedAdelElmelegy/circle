import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/category_model/cat_item.dart';
import 'package:circletraning/data/models/response/category_model/category_model.dart';
import 'package:circletraning/data/repository/category_repo.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  CategoryModel? categoryModel;
  ApiErrorHandler? apiErrorHandler;
  CategoryRepo categoryRepo;
  CategoryProvider(this.categoryRepo);
  List<CatItem>? catList = [];
  Future<ApiResponse> getCategory() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await categoryRepo.getCategory();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      categoryModel = CategoryModel.fromJson(apiResponse.response!.data);
      if (categoryModel!.code == 200) {
        catList = categoryModel!.data!;
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
