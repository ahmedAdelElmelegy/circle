import 'package:circletraning/core/utils/dio_factory.dart';
import 'package:circletraning/data/data_source/remote/dio/api_services.dart';
import 'package:circletraning/data/provider/add_and_remove_provider.dart';
import 'package:circletraning/data/provider/calculate_order_cost_provider.dart';
import 'package:circletraning/data/provider/cancel_order_provider.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/data/provider/city_provider.dart';
import 'package:circletraning/data/provider/contact_us_provider.dart';
import 'package:circletraning/data/provider/favorite_provider.dart';
import 'package:circletraning/data/provider/latest_product_provider.dart';
import 'package:circletraning/data/provider/login_provider.dart';
import 'package:circletraning/data/provider/order_provider.dart';
import 'package:circletraning/data/provider/payment_provider.dart';
import 'package:circletraning/data/provider/points_provider.dart';
import 'package:circletraning/data/provider/product_provider.dart';
import 'package:circletraning/data/provider/shared_prefrence_provider.dart';
import 'package:circletraning/data/provider/sign_up_provider.dart';
import 'package:circletraning/data/provider/slider_provider.dart';
import 'package:circletraning/data/provider/store_order_provider.dart';
import 'package:circletraning/data/provider/sub_category_provider.dart';
import 'package:circletraning/data/provider/update_profile_provider.dart';
import 'package:circletraning/data/repository/add_and_remove_favorite_repo.dart';
import 'package:circletraning/data/repository/calculate_order_cost_repo.dart';
import 'package:circletraning/data/repository/cancel_order_repo.dart';
import 'package:circletraning/data/repository/category_repo.dart';
import 'package:circletraning/data/repository/city_repo.dart';
import 'package:circletraning/data/repository/contact_us_repo.dart';
import 'package:circletraning/data/repository/favorite_repo.dart';
import 'package:circletraning/data/repository/latest_product_repo.dart';
import 'package:circletraning/data/repository/login_repo.dart';
import 'package:circletraning/data/repository/order_repo.dart';
import 'package:circletraning/data/repository/payment_repo.dart';
import 'package:circletraning/data/repository/point_repo.dart';
import 'package:circletraning/data/repository/product_repo.dart';
import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:circletraning/data/repository/sign_up_repo.dart';
import 'package:circletraning/data/repository/slider_repo.dart';
import 'package:circletraning/data/repository/store_order_repo.dart';
import 'package:circletraning/data/repository/sub_category_repo.dart';
import 'package:circletraning/data/repository/update_profile_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton(() => dio);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => ApiService(getIt(), getIt()));
  getIt.registerLazySingleton(() => SaveUserData(getIt(), getIt()));
  // repositories
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton<SubCategoryRepo>(() => SubCategoryRepo(getIt()));
  getIt.registerLazySingleton<SliderRepo>(() => SliderRepo(getIt()));
  getIt.registerLazySingleton<LatestProductRepo>(
      () => LatestProductRepo(getIt()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<CityRepo>(() => CityRepo(getIt()));
  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt()));
  getIt.registerLazySingleton<AddAndRemoveFavoriteRepo>(
      () => AddAndRemoveFavoriteRepo(getIt()));
  getIt.registerLazySingleton<PointRepo>(() => PointRepo(getIt()));
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt()));
  getIt.registerLazySingleton<CalculateOrderCostRepo>(
      () => CalculateOrderCostRepo(getIt()));
  getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt()));
  getIt.registerLazySingleton<StoreOrderRepo>(() => StoreOrderRepo(getIt()));
  getIt.registerLazySingleton<CancelOrderRepo>(() => CancelOrderRepo(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerLazySingleton<UpdateProfileRepo>(
      () => UpdateProfileRepo(getIt()));
  getIt.registerLazySingleton<ContactUsRepo>(() => ContactUsRepo(getIt()));
  // providers
  getIt
      .registerLazySingleton<CategoryProvider>(() => CategoryProvider(getIt()));
  getIt.registerLazySingleton<SubCategoryProvider>(
      () => SubCategoryProvider(getIt()));
  getIt.registerLazySingleton<SliderProvider>(() => SliderProvider(getIt()));
  getIt.registerLazySingleton<LatestProductProvider>(
      () => LatestProductProvider(getIt()));
  getIt.registerLazySingleton<ProductProvider>(() => ProductProvider(getIt()));
  getIt.registerLazySingleton<SharedPrefrenceProvider>(
      () => SharedPrefrenceProvider());
  getIt.registerLazySingleton<LoginProvider>(
      () => LoginProvider(getIt(), getIt()));
  getIt.registerLazySingleton<CityProvider>(() => CityProvider(getIt()));
  getIt
      .registerLazySingleton<FavoriteProvider>(() => FavoriteProvider(getIt()));
  getIt.registerLazySingleton<AddAndRemovFavoriteeProvider>(
      () => AddAndRemovFavoriteeProvider(getIt()));
  getIt.registerLazySingleton<PointsProvider>(() => PointsProvider(getIt()));
  getIt.registerLazySingleton<OrderProvider>(() => OrderProvider(getIt()));
  getIt.registerLazySingleton<CalculateOrderCostProvider>(
      () => CalculateOrderCostProvider(getIt()));
  getIt.registerLazySingleton<PaymentProvider>(() => PaymentProvider(getIt()));
  getIt.registerLazySingleton<StoreOrderProvider>(
      () => StoreOrderProvider(getIt()));
  getIt.registerLazySingleton<CancelOrderProvider>(
      () => CancelOrderProvider(getIt()));
  getIt.registerLazySingleton<SignUpProvider>(
      () => SignUpProvider(getIt(), getIt()));
  getIt.registerLazySingleton<UpdateProfileProvider>(
      () => UpdateProfileProvider(getIt(), getIt()));
  getIt.registerLazySingleton<ContactUsProvider>(
      () => ContactUsProvider(getIt()));
}
