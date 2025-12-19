import 'package:circle/core/di/injection.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/features/home/presentation/view_model/home_provider.dart';
import 'package:circle/features/cart/presentation/view_model/shared_prefrence_provider.dart';
import 'package:circle/features/home/presentation/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LatestProductGridView extends StatelessWidget {
  const LatestProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    SharedPrefrenceProvider sharedPrefProvider = getIt();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.isLoading ? 2 : provider.latestProductList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 12.h,
        ),
        itemBuilder: (BuildContext context, int index) => provider.isLoading
            ? const LoadingWidget()
            : ProductItem(
                onTap: () {
                  sharedPrefProvider.addToCart(
                      provider.latestProductList[index], context,
                      fromHome: true);
                },
                product: provider.latestProductList[index],
              ),
      ),
    );
  }
}
