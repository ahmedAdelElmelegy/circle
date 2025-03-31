import 'package:circletraning/core/utils/dio_factory.dart';
import 'package:circletraning/data/data_source/remote/dio/api_services.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/data/provider/sub_category_provider.dart';
import 'package:circletraning/data/repository/category_repo.dart';
import 'package:circletraning/data/repository/sub_category_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton(() => dio);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => ApiService(getIt(), getIt()));

  // repositories
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton<SubCategoryRepo>(() => SubCategoryRepo(getIt()));
  // providers
  getIt
      .registerLazySingleton<CategoryProvider>(() => CategoryProvider(getIt()));
  getIt.registerLazySingleton<SubCategoryProvider>(
      () => SubCategoryProvider(getIt()));
}
