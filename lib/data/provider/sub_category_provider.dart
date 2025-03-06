import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/sub_category_model/sub_cat_item.dart';
import 'package:circletraning/data/models/response/sub_category_model/sub_category_model.dart';
import 'package:circletraning/data/repository/sub_category_repo.dart';
import 'package:flutter/material.dart';

class SubCategoryProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  SubCategoryModel? subCategoryModel;
  ApiErrorHandler? apiErrorHandler;
  SubCategoryRepo subCategoryRepo;
  SubCategoryProvider(this.subCategoryRepo);
  List<SubCategoryItem> subCatList = [];

  Future<ApiResponse> getsubCategory(int id) async {
    isLoading = true;
    notifyListeners();
    subCatList.clear();
    notifyListeners();
    ApiResponse apiResponse = await subCategoryRepo.getSubCategory(id);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      subCategoryModel = SubCategoryModel.fromJson(apiResponse.response!.data);
      if (subCategoryModel!.code == 200) {
        subCatList = subCategoryModel!.data!;
      }
    } else {
      isFailure = true;
      apiErrorHandler = ApiErrorHandler.getMessage(apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
