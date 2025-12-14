import 'package:circle/core/error/failure.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/sub_category_model/sub_category_data.dart';
import 'package:circle/data/models/response/sub_category_model/sub_category_model.dart';
import 'package:circle/data/repository/sub_category_repo.dart';
import 'package:flutter/material.dart';

class SubCategoryProvider with ChangeNotifier {
  SubCategoryModel? _subCategoryModel;
  bool isLoading = false;
  bool isFailure = false;
  List<SubCategoryData> subCategoryList = [];
  final SubCategoryRepo subCategoryRepo;
  ServerFailure? serverFailure;

  SubCategoryProvider(this.subCategoryRepo);

  Future<ApiResponse> getsubCategory(int id) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await subCategoryRepo.getSubCategory(id);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      _subCategoryModel = SubCategoryModel.fromJson(apiResponse.response!.data);

      if (_subCategoryModel!.code == 200) {
        subCategoryList.clear();
        subCategoryList.addAll(_subCategoryModel!.data!);
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
