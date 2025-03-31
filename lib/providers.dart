import 'package:circletraning/core/di/injection.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/data/provider/home_provider.dart';
import 'package:circletraning/data/provider/order_provider.dart';
import 'package:circletraning/data/provider/sub_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenerateMultiProvider extends StatelessWidget {
  final Widget child;
  const GenerateMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(
          create: (_) => getIt<CategoryProvider>()..getCategory()),
      ChangeNotifierProvider(create: (_) => getIt<SubCategoryProvider>()),
    ], child: child);
  }
}
