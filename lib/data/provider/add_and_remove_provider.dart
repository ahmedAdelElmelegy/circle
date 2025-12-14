import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/init_model.dart';
import 'package:circle/data/repository/add_and_remove_favorite_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAndRemovFavoriteeProvider with ChangeNotifier {
  bool isLoading = false;
  bool isFailure = false;

  InitModel? initModel;
  final AddAndRemoveFavoriteRepo favoriteRepo;

  AddAndRemovFavoriteeProvider(this.favoriteRepo);
  Future<ApiResponse> addAndRemoveFavorite(int id) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await favoriteRepo.addAndRemoveFavorite(id);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      initModel = InitModel.fromJson(apiResponse.response!.data);
      if (initModel!.code == 200) {
        Fluttertoast.showToast(
            msg: 'product add to favorite successfully'.tr());
        notifyListeners();
      }
    } else {
      isFailure = true;
      Fluttertoast.showToast(msg: apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
