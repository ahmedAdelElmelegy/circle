import 'package:circletraning/data/data_source/remote/exception/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/sub_category_model/sub_category_data.dart';
import 'package:circletraning/data/models/response/sub_category_model/sub_category_model.dart';
import 'package:circletraning/data/repository/sub_category_repo.dart';
import 'package:flutter/material.dart';

class SubCategoryProvider with ChangeNotifier {
  SubCategoryModel? _subCategoryModel;
  bool isLoading = false;
  bool isFailure = false;
  List<SubCategoryData> subCategoryList = [];
  final SubCategoryRepo subCategoryRepo;
  ApiErrorHandler? apiErrorHandler;

  SubCategoryProvider(this.subCategoryRepo);

  Future<ApiResponse> getsubCategory(int id) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await subCategoryRepo.getSubCategory(id);
    if (apiResponse.response!.statusCode == 200 ||
        apiResponse.response!.data != null) {
      _subCategoryModel = SubCategoryModel.fromJson(apiResponse.response!.data);
      subCategoryList.clear();

      if (_subCategoryModel!.code == 200) {
        subCategoryList.addAll(_subCategoryModel!.data!);
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
