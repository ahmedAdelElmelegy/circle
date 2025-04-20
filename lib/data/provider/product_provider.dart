import 'package:circle/core/error/failure.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/product_model/product_model.dart';
import 'package:circle/data/models/response/product_model/product_model_data.dart';
import 'package:circle/data/repository/product_repo.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  ServerFailure? serverFailure;
  ProductRepo productRepo;
  ProductModel? productModel;
  List<ProductModelData> productList = [];

  ProductProvider(this.productRepo);
  Future<ApiResponse> getProduct(Map<String, dynamic> query) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await productRepo.getProduct(query);
    if (apiResponse.response != null &&
        apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      productModel = ProductModel.fromJson(apiResponse.response!.data);
      productList.clear();
      if (productModel!.code == 200) {
        productList.addAll(productModel!.data!);
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
