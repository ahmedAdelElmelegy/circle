import 'package:circle/core/network/network_provider.dart';
import 'package:circle/features/home/logic/task_provider.dart';
import 'package:circle/core/di/injection.dart';
import 'package:circle/features/favorite/presentation/view_model/add_and_remove_product_to_favorite_provider.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:circle/features/orders/presentation/view_model/cancel_order_provider.dart';
import 'package:circle/features/home/presentation/view_model/category_provider.dart';
import 'package:circle/features/sign_up/presentation/view_model/city_provider.dart';
import 'package:circle/features/contact_us/presentation/view_model/contact_us_provider.dart';
import 'package:circle/features/favorite/presentation/view_model/favorite_provider.dart';
import 'package:circle/features/home/presentation/view_model/home_provider.dart';
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;
  const GenerateMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => getIt<HomeProvider>()..getHomeData()),
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
      ChangeNotifierProvider(
        create: (_) => NetworkProvider(networkInfo: getIt()),
      ),
      ChangeNotifierProvider(
        create: (_) => getIt<TaskProvider>()..fetchTasks(),
      ),
    ], child: child);
  }
}
