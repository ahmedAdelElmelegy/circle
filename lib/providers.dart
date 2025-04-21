import 'package:circle/core/di/injection.dart';
import 'package:circle/data/provider/add_and_remove_provider.dart';
import 'package:circle/data/provider/calculate_order_cost_provider.dart';
import 'package:circle/data/provider/cancel_order_provider.dart';
import 'package:circle/data/provider/category_provider.dart';
import 'package:circle/data/provider/city_provider.dart';
import 'package:circle/data/provider/contact_us_provider.dart';
import 'package:circle/data/provider/favorite_provider.dart';
import 'package:circle/data/provider/home_provider.dart';
import 'package:circle/data/provider/latest_product_provider.dart';
import 'package:circle/data/provider/login_provider.dart';
import 'package:circle/data/provider/network_services.dart';
import 'package:circle/data/provider/order_provider.dart';
import 'package:circle/data/provider/payment_provider.dart';
import 'package:circle/data/provider/points_provider.dart';
import 'package:circle/data/provider/product_provider.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';
import 'package:circle/data/provider/sign_up_provider.dart';
import 'package:circle/data/provider/slider_provider.dart';
import 'package:circle/data/provider/store_order_provider.dart';
import 'package:circle/data/provider/sub_category_provider.dart';
import 'package:circle/data/provider/update_profile_provider.dart';
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
      ChangeNotifierProvider(create: (_) => NetworkService()),
    ], child: child);
  }
}
