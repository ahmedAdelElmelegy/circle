import 'package:circletraning/features/about/ui/about_screen.dart';
import 'package:circletraning/features/cart/ui/cart_screen.dart';
import 'package:circletraning/features/category/ui/category_screen.dart';
import 'package:circletraning/features/favorite/ui/favorite_screen.dart';

import 'package:circletraning/features/login/ui/login_screen.dart';
import 'package:circletraning/features/main_screen.dart';
import 'package:circletraning/features/notifications/ui/notification_screen.dart';
import 'package:circletraning/features/orders/ui/orders_screen.dart';
import 'package:circletraning/features/points/ui/points_screen.dart';

import 'package:circletraning/features/sign_up/ui/sign_up.dart';
import 'package:circletraning/features/splash/ui/splash_screen.dart';
import 'package:circletraning/main.dart';
import 'package:circletraning/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GenerateMultiProvider(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                navigatorKey: navigator,
                title: 'Circle App',
                home: const SplashScreen(),
                routes: {
                  MainScreen.routeName: (context) => const MainScreen(),
                  CategoryScreen.routeName: (context) => const CategoryScreen(),
                  // ProductScreen.routeName: (context) => const ProductScreen(),
                  NotificationScreen.routeName: (context) =>
                      const NotificationScreen(),
                  CartScreen.routeName: (context) => const CartScreen(),

                  OrdersScreen.routeName: (context) => const OrdersScreen(),
                  FavoriteScreen.routeName: (context) => const FavoriteScreen(),
                  PointsScreen.routeName: (context) => const PointsScreen(),

                  AboutScreen.routeName: (context) => const AboutScreen(),
                  LoginScreen.routeName: (context) => const LoginScreen(),
                  SignUp.routeName: (context) => const SignUp(),
                },
              )),
    );
  }
}
