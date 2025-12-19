import 'package:circle/core/network/data_source/remote/exception/app_exeptions.dart';
import 'package:circle/core/network/models/response/base/api_response.dart'
    show ApiResponse;
import 'package:circle/core/network/models/response/category_model/category_data.dart';
import 'package:circle/features/home/data/model/response/slider_model/slider.dart';
import 'package:circle/features/home/data/model/response/slider_model/slider_model.dart';
import 'package:circle/features/home/data/repo/latest_product_repo.dart';
import 'package:circle/features/home/data/repo/slider_repo.dart';
import 'package:circle/features/home/presentation/view_model/category_provider.dart';
import 'package:circle/features/products/data/models/product_model/product_model_data.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final SliderRepo sliderRepo;
  final LatestProductRepo latestProductRepo;
  final CategoryProvider categoryProvider; // ✅ shared

  HomeProvider(
    this.sliderRepo,
    this.latestProductRepo,
    this.categoryProvider,
  );

  // ---------------- UI STATE ----------------

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool isLoading = false;
  AppException? _error;

  AppException? get error => _error;
  bool get hasError => _error != null;

  // ---------------- DATA ----------------

  int notificationCount = 0;
  List<SSlider> sliderList = [];
  List<ProductModelData> latestProductList = [];

  List<CategoryData> get categoryList => categoryProvider.categoryList;

  Future<void> getHomeData() async {
    isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final responses = await Future.wait([
        sliderRepo.getSlider(),
        latestProductRepo.getLatestProduct(),
      ]);

      _handleSliderResponse(responses[0]);
      _handleLatestProductResponse(responses[1]);

      /// 👇 مهم: نتأكد إن Category اتحملت
      if (categoryProvider.categoryList.isEmpty) {
        await categoryProvider.getCategory();
      }
    } on AppException catch (e) {
      _error = e;
    } catch (e) {
      _error = UnknownException('Unexpected error occurred');
    }

    isLoading = false;
    notifyListeners();
  }

  void _handleSliderResponse(ApiResponse response) {
    if (_isValidResponse(response)) {
      final model = SliderModel.fromJson(response.response!.data);
      if (model.code == 200) {
        sliderList
          ..clear()
          ..addAll(model.data!.slider!);
        notificationCount = model.data!.notificationCount!;
      }
    } else {
      throw response.error!;
    }
  }

  void _handleLatestProductResponse(ApiResponse response) {
    if (_isValidResponse(response)) {
      latestProductList
        ..clear()
        ..addAll(
          (response.response!.data['data'] as List)
              .map((e) => ProductModelData.fromJson(e))
              .toList(),
        );
    } else {
      throw response.error!;
    }
  }

  bool _isValidResponse(ApiResponse response) {
    return response.response != null &&
        response.response!.statusCode == 200 &&
        response.response!.data != null;
  }

  bool get isNetworkError => _error is NetworkException;
  bool get isAuthError => _error is AuthenticationException;
  bool get isServerError => _error is ServerException;

  Future<void> retry() => getHomeData();
}
