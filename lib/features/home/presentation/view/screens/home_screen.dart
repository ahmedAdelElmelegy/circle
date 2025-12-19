import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/widgets/network_error_screen.dart';
import 'package:circle/features/home/presentation/view_model/home_provider.dart';
import 'package:circle/features/home/presentation/view/widgets/category_grid_view.dart';
import 'package:circle/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:circle/features/home/presentation/view/widgets/picture_swiper.dart';
import 'package:circle/features/home/presentation/view/widgets/latest_product_grid_view.dart';
import 'package:circle/features/home/presentation/view/widgets/row_of_home.dart';
import 'package:circle/features/home/presentation/view/widgets/search_and_chose_city.dart';
import 'package:circle/features/products/presentation/view/product_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        if (provider.hasError) {
          if (provider.isNetworkError) {
            return CustomErrorScreen(
                message: 'no_internet_connection'.tr(),
                onTryAgain: () {
                  provider.getHomeData();
                });
          }
          return CustomErrorScreen(
              message: provider.error!.message,
              onTryAgain: () {
                provider.getHomeData();
              });
        }
        return Skeletonizer(
          enabled: provider.isLoading,
          child: Column(
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
      }),
    );
  }
}
