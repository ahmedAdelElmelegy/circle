import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/data/provider/add_and_remove_provider.dart';
import 'package:circletraning/data/provider/calculate_order_cost_provider.dart';
import 'package:circletraning/data/provider/cancel_order_provider.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/data/provider/city_provider.dart';
import 'package:circletraning/data/provider/contact_us_provider.dart';
import 'package:circletraning/data/provider/favorite_provider.dart';
import 'package:circletraning/data/provider/home_provider.dart';
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;
  const GenerateMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => getIt<OrderProvider>()),
      ChangeNotifierProvider(
          create: (_) => getIt<CategoryProvider>()..getCategory()),
      ChangeNotifierProvider(create: (_) => getIt<SubCategoryProvider>()),
      ChangeNotifierProvider(
          create: (_) => getIt<SliderProvider>()..getSlider()),
      ChangeNotifierProvider(
          create: (_) => getIt<LatestProductProvider>()..getLatestProduct()),
      ChangeNotifierProvider(create: (_) => getIt<ProductProvider>()),
      ChangeNotifierProvider(
          create: (_) => getIt<SharedPrefrenceProvider>()..loadCartItem()),
      ChangeNotifierProvider(create: (_) => getIt<LoginProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<CityProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<FavoriteProvider>()),
      ChangeNotifierProvider(
          create: (_) => getIt<AddAndRemovFavoriteeProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<PointsProvider>()),
      ChangeNotifierProvider(
          create: (_) => getIt<CalculateOrderCostProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<PaymentProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<StoreOrderProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<CancelOrderProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<SignUpProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<UpdateProfileProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<ContactUsProvider>()),
    ], child: child);
  }
}
