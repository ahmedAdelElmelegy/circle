import 'package:circle/core/network/data_source/remote/exception/app_exeptions.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/core/network/models/response/category_model/category_data.dart';
import 'package:circle/core/network/models/response/category_model/category_model.dart';
import 'package:circle/core/network/models/response/sub_category_model/sub_category_data.dart';
import 'package:circle/features/category/presentation/view_model/sub_category_provider.dart';
import 'package:circle/features/home/data/repo/category_repo.dart';
import 'package:circle/features/products/data/models/product_model/product_model_data.dart';
import 'package:circle/features/products/presentation/view_model/product_provider.dart';

import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  CategoryModel? _categoryModel;
  bool isLoading = false;
  SubCategoryProvider subCategoryProvider;
  ProductProvider productProvider;
  bool get isFailure => serverFailure != null;
  List<CategoryData> categoryList = [];
  List<SubCategoryData> get subCategoryList =>
      subCategoryProvider.subCategoryList;
  List<ProductModelData> get productList => productProvider.productList;
  final CategoryRepo categoryRepo;
  AppException? serverFailure;
  CategoryProvider(
      this.categoryRepo, this.subCategoryProvider, this.productProvider);

  Future<ApiResponse> getCategory() async {
    serverFailure = null;
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await categoryRepo.getCategory();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      _categoryModel = CategoryModel.fromJson(apiResponse.response!.data);
      if (_categoryModel!.code == 200) {
        categoryList.clear(); // 🔴 مهم
        categoryList.addAll(_categoryModel!.data!);
      }
    } else {
      serverFailure = apiResponse.error;

      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }

  bool get isNetworkError => serverFailure is NetworkException;
  bool get isAuthError => serverFailure is AuthenticationException;
  bool get isServerError => serverFailure is ServerException;
}
