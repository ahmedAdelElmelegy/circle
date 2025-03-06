import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/product_model/product_datum.dart';
import 'package:circletraning/data/models/response/product_model/product_model.dart';
import 'package:circletraning/data/repository/latest_product_repo.dart';
import 'package:circletraning/data/repository/product_repo.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModelItem> productList = [];
  bool isLoading = false;
  bool isFailure = false;
  ProductModel? productModel;
  ProductRepo productRepo;
  ApiErrorHandler? apiErrorHandler;
  ProductProvider(this.productRepo);
  Future<ApiResponse> getProduct({Map<String, dynamic>? query}) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await productRepo.getProduct(query: query);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      productModel = ProductModel.fromJson(apiResponse.response!.data);
      if (productModel!.code == 200) {
        productList.clear();
        productList.addAll(productModel!.data!);
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
