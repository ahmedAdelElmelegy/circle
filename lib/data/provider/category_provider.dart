import 'package:circle/core/error/failure.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/category_model/category_data.dart';
import 'package:circle/data/models/response/category_model/category_model.dart';
import 'package:circle/data/repository/category_repo.dart';

import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  CategoryModel? _categoryModel;
  bool isLoading = false;
  bool isFailure = false;
  List<CategoryData> categoryList = [];
  final CategoryRepo categoryRepo;
  ServerFailure? serverFailure;
  CategoryProvider(this.categoryRepo);

  Future<ApiResponse> getCategory() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await categoryRepo.getCategory();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      _categoryModel = CategoryModel.fromJson(apiResponse.response!.data);
      if (_categoryModel!.code == 200) {
        categoryList.addAll(_categoryModel!.data!);
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
