import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/features/favorite/presentation/view_model/favorite_provider.dart';
import 'package:circle/features/cart/presentation/view/widget/empty_cart.dart';
import 'package:circle/features/home/presentation/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// FavoriteProvider favorite = getIt();

class FavoriteProductGridView extends StatefulWidget {
  const FavoriteProductGridView({
    super.key,
  });

  @override
  State<FavoriteProductGridView> createState() =>
      _FavoriteProductGridViewState();
}

class _FavoriteProductGridViewState extends State<FavoriteProductGridView> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FavoriteProvider>(context, listen: false).getFavorite();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<FavoriteProvider>(
          builder: (context, provider, child) {
            if (provider.favoriteList.isEmpty) {
              return EmptyWidget(
                  isFavorite: true,
                  title: 'favorite_is_empty',
                  subtitle:
                      'looks_like_you_dont_have_anything_in_your_favorite',
                  image: Assets.emptyFavrite);
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.favoriteList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 12.h,
              ),
              itemBuilder: (BuildContext context, int index) =>
                  provider.isLoading
                      ? const LoadingWidget()
                      : ProductItem(
                          product: provider.favoriteList[index],
                        ),
            );
          },
        ));
  }
}
