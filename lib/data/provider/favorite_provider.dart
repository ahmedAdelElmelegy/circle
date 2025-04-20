import 'package:circletraning/core/error/failure.dart';
import 'package:circletraning/data/models/response/base/api_response.dart';
import 'package:circletraning/data/models/response/product_model/product_model.dart';
import 'package:circletraning/data/models/response/product_model/product_model_data.dart';
import 'package:circletraning/data/repository/favorite_repo.dart';
import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;
  ServerFailure? serverFailure;
  FavoriteRepo favoriteRepo;
  FavoriteProvider(this.favoriteRepo);
  ProductModel? productModel;
  List<ProductModelData> favoriteList = [];
  Future<ApiResponse> getFavorite() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await favoriteRepo.getFavorite();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      productModel = ProductModel.fromJson(apiResponse.response!.data);
      favoriteList.clear();
      if (productModel!.code == 200) {
        favoriteList.addAll(productModel!.data!);
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
