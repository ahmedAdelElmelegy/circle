import 'package:circle/core/network/network_info.dart';
import 'package:circle/core/utils/dio_factory.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:circle/core/network/data_source/remote/dio/api_services.dart';
import 'package:circle/features/favorite/presentation/view_model/add_and_remove_product_to_favorite_provider.dart';
import 'package:circle/features/home/presentation/view_model/home_provider.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:circle/features/orders/presentation/view_model/cancel_order_provider.dart';
import 'package:circle/features/home/presentation/view_model/category_provider.dart';
import 'package:circle/features/sign_up/presentation/view_model/city_provider.dart';
import 'package:circle/features/contact_us/presentation/view_model/contact_us_provider.dart';
import 'package:circle/features/favorite/presentation/view_model/favorite_provider.dart';
import 'package:circle/features/home/presentation/view_model/latest_product_provider.dart';
import 'package:circle/features/login/presentation/view_model/login_provider.dart';
import 'package:circle/features/orders/presentation/view_model/order_provider.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/payment_provider.dart';
import 'package:circle/features/points/presentation/view_model/points_provider.dart';
import 'package:circle/features/products/presentation/view_model/product_provider.dart';
import 'package:circle/features/cart/presentation/view_model/shared_prefrence_provider.dart';
import 'package:circle/features/sign_up/presentation/view_model/sign_up_provider.dart';
import 'package:circle/features/home/presentation/view_model/slider_provider.dart';
import 'package:circle/features/orders/presentation/view_model/store_order_provider.dart';
import 'package:circle/features/category/presentation/view_model/sub_category_provider.dart';
import 'package:circle/features/settings/presentation/view_model/update_profile_provider.dart';
import 'package:circle/features/favorite/data/repo/add_and_remove_favorite_repo.dart';
import 'package:circle/features/pay_and_delevary/data/repo/calculate_order_cost_repo.dart';
import 'package:circle/features/orders/data/repo/cancel_order_repo.dart';
import 'package:circle/features/home/data/repo/category_repo.dart';
import 'package:circle/features/sign_up/data/repo/city_repo.dart';
import 'package:circle/features/contact_us/data/repo/contact_us_repo.dart';
import 'package:circle/features/favorite/data/repo/favorite_repo.dart';
import 'package:circle/features/home/data/repo/latest_product_repo.dart';
import 'package:circle/features/login/data/repo/login_repo.dart';
import 'package:circle/features/orders/data/repo/order_repo.dart';
import 'package:circle/features/pay_and_delevary/data/repo/payment_repo.dart';
import 'package:circle/features/points/data/repo/point_repo.dart';
import 'package:circle/features/products/data/repo/product_repo.dart';
import 'package:circle/features/sign_up/data/repo/save_user_data.dart';
import 'package:circle/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:circle/features/home/data/repo/slider_repo.dart';
import 'package:circle/features/orders/data/repo/store_order_repo.dart';
import 'package:circle/features/category/data/repo/sub_category_repo.dart';
import 'package:circle/features/settings/data/repo/update_profile_repo.dart';
import 'package:circle/features/home/logic/task_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton(() => dio);
  
  // Network Info
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

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
  getIt.registerLazySingleton<CategoryProvider>(
      () => CategoryProvider(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<SubCategoryProvider>(
      () => SubCategoryProvider(getIt()));
  getIt.registerLazySingleton<SliderProvider>(() => SliderProvider(getIt()));
  getIt.registerLazySingleton<LatestProductProvider>(
      () => LatestProductProvider(getIt()));
  getIt.registerLazySingleton<ProductProvider>(() => ProductProvider(
        getIt(),
      ));
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
  getIt.registerLazySingleton<HomeProvider>(
      () => HomeProvider(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<TaskProvider>(() => TaskProvider());
}
