import 'package:circle/core/network/data_source/remote/exception/app_exeptions.dart';
import 'package:circle/core/network/models/response/base/api_response.dart';
import 'package:circle/features/products/data/models/product_model/product_model.dart';
import 'package:circle/features/products/data/models/product_model/product_model_data.dart';
import 'package:circle/features/home/data/repo/latest_product_repo.dart';
import 'package:flutter/cupertino.dart';

class LatestProductProvider with ChangeNotifier {
  bool isLoading = false;
  AppException? serverFailure;
  bool get isFailure => serverFailure != null;
  LatestProductRepo latestProductRepo;
  ProductModel? productModel;
  List<ProductModelData> productList = [];

  LatestProductProvider(this.latestProductRepo);
  Future<ApiResponse> getLatestProduct() async {
    serverFailure = null;
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await latestProductRepo.getLatestProduct();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      productModel = ProductModel.fromJson(apiResponse.response!.data);
      if (productModel!.code == 200) {
        productList.clear();
        productList.addAll(productModel!.data!);
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
