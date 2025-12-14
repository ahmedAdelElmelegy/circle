import 'package:circle/core/error/failure.dart';
import 'package:circle/data/models/response/base/api_response.dart';
import 'package:circle/data/models/response/points_model/points_model.dart';
import 'package:circle/data/repository/point_repo.dart';
import 'package:flutter/widgets.dart';

class PointsProvider with ChangeNotifier {
  PointsModel? pointsModel;
  bool isLoading = false;
  bool isError = false;
  PointRepo pointRepo;
  ServerFailure? serverFailure;
  List<dynamic> history = [];
  String error = '';
  int points = 0;
  PointsProvider(this.pointRepo);

  Future<ApiResponse> getPoints() async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await pointRepo.getPoint();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200 &&
        apiResponse.response!.data != null) {
      pointsModel = PointsModel.fromJson(apiResponse.response!.data);
      if (pointsModel!.code == 200) {
        points = pointsModel!.data!.points!;
        history.addAll(pointsModel!.data!.history!);
      }
    } else {
      isError = true;
      serverFailure = ServerFailure(apiResponse.error);
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
    return apiResponse;
  }
}
