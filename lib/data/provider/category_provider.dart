import 'package:circletraning/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/category_model/category_data.dart';
import 'package:circletraning/data/models/response/category_model/category_model.dart';
import 'package:circletraning/data/repository/category_repo.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  CategoryModel? _categoryModel;
  bool isLoading = false;
  bool isFailure = false;
  List<CategoryData> categoryList = [];
  final CategoryRepo categoryRepo;
  ApiErrorHandler? apiErrorHandler;
  CategoryProvider(this.categoryRepo);

  Future<ApiResponse> getCategory() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await categoryRepo.getCategory();
    if (apiResponse.response!.statusCode == 200 ||
        apiResponse.response!.data != null) {
      _categoryModel = CategoryModel.fromJson(apiResponse.response!.data);
      if (_categoryModel!.code == 200) {
        categoryList.addAll(_categoryModel!.data!);
      }
    } else {
      isFailure = true;
      apiErrorHandler = ApiErrorHandler.getMessage(apiResponse.error);
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
