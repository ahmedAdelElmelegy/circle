import 'package:circletraning/core/utils/dio_factory.dart';
import 'package:circletraning/data/datasource/remote/dio/api_services.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/data/provider/city_provider.dart';
import 'package:circletraning/data/provider/latest_product_provider.dart';
import 'package:circletraning/data/provider/login_provider.dart';
import 'package:circletraning/data/provider/product_provider.dart';
import 'package:circletraning/data/provider/regester_provider.dart';
import 'package:circletraning/data/provider/slider_provider.dart';
import 'package:circletraning/data/provider/sub_category_provider.dart';
import 'package:circletraning/data/repository/category_repo.dart';
import 'package:circletraning/data/repository/city_repo.dart';
import 'package:circletraning/data/repository/latest_product_repo.dart';
import 'package:circletraning/data/repository/login_repo.dart';
import 'package:circletraning/data/repository/product_repo.dart';
import 'package:circletraning/data/repository/regester_repo.dart';
import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:circletraning/data/repository/slider_repo.dart';
import 'package:circletraning/data/repository/sub_category_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  Dio dio = DioFactory.getDio();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => dio);
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => ApiServices(getIt(), getIt()));
  getIt.registerLazySingleton(() => ApiErrorHandler());
  getIt.registerLazySingleton(() => SaveUserData(getIt(), getIt()));

  getIt.registerLazySingleton(() => SliderProvider(getIt()));
  getIt.registerLazySingleton(() => CategoryProvider(getIt()));
  getIt.registerLazySingleton(() => LatestProductProvider(getIt()));
  getIt.registerLazySingleton(() => SubCategoryProvider(getIt()));
  getIt.registerLazySingleton(() => ProductProvider(getIt()));
  getIt.registerLazySingleton(() => LoginProvider(getIt(), getIt()));
  getIt.registerLazySingleton(() => CityProvider(getIt()));
  getIt.registerLazySingleton(() => RegesterProvider(getIt(), getIt()));
  // repo
  getIt.registerLazySingleton(() => SliderRepo(getIt()));
  getIt.registerLazySingleton(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton(() => LatestProductRepo(getIt()));
  getIt.registerLazySingleton(() => SubCategoryRepo(getIt()));
  getIt.registerLazySingleton(() => ProductRepo(getIt()));
  getIt.registerLazySingleton(() => LoginRepo(getIt(), getIt()));
  getIt.registerLazySingleton(() => CityRepo(getIt()));
  getIt.registerLazySingleton(() => RegesterRepo(getIt()));
}
