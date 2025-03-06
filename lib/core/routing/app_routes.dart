import 'package:circletraning/core/routing/routes.dart';
import 'package:circletraning/features/category/ui/category_screen.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:circletraning/features/products/ui/product_screen.dart';
import 'package:circletraning/features/splash/ui/splash_screen.dart';

import 'package:flutter/material.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case Routes.category:
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
        );
      case Routes.products:
        return MaterialPageRoute(
          builder: (_) => const ProductScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
