import 'package:circle/core/di/injection.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/data/provider/category_provider.dart';
import 'package:circle/data/provider/home_provider.dart';
import 'package:circle/data/provider/latest_product_provider.dart';
import 'package:circle/data/provider/slider_provider.dart';
import 'package:circle/features/home/ui/widget/category_grid_view.dart';
import 'package:circle/features/home/ui/widget/custom_app_bar.dart';
import 'package:circle/features/home/ui/widget/picture_swiper.dart';
import 'package:circle/features/home/ui/widget/latest_product_grid_view.dart';
import 'package:circle/features/home/ui/widget/row_of_home.dart';
import 'package:circle/features/home/ui/widget/search_and_chose_city.dart';
import 'package:circle/features/products/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SliderProvider sliderProvider = getIt();
CategoryProvider categoryProvider = getIt();
LatestProductProvider latestProductProvider = getIt();

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  verticalSpace(8),
                  const SearchAndChoseCity(),
                  verticalSpace(16),
                  const PicturesSwiper(),
                  verticalSpace(16),
                  RowOfHome(
                    text: 'category',
                    onTap: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .setIndex(1);
                    },
                  ),
                  const CategoryGridView(),
                  verticalSpace(16),
                  RowOfHome(
                    text: 'latest_products',
                    onTap: () {
                      push(const ProductScreen(index: 0, subIndex: 0));
                    },
                  ),
                  verticalSpace(12),
                  const LatestProductGridView()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
