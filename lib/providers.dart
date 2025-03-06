import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/data/provider/city_provider.dart';
import 'package:circletraning/data/provider/latest_product_provider.dart';
import 'package:circletraning/data/provider/login_provider.dart';
import 'package:circletraning/data/provider/product_provider.dart';
import 'package:circletraning/data/provider/regester_provider.dart';
import 'package:circletraning/data/provider/sub_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/provider/home_provider.dart';
import 'data/provider/order_provider.dart';
import 'data/provider/slider_provider.dart';

class GenerateMultiProviders extends StatelessWidget {
  final Widget child;
  const GenerateMultiProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(
          create: (_) => getIt<SliderProvider>()..getSlider(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<CategoryProvider>()..getCategory(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<LatestProductProvider>()..getLatestProduct(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<SubCategoryProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<ProductProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<LoginProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<CityProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<RegesterProvider>(),
        ),
      ],
      child: child,
    );
  }
}
