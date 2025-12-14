import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/features/favorite/widgets/favorite_product_grid_view.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('favorite', context),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpace(16),
              const FavoriteProductGridView(),
            ],
          )),
    );
  }
}
