import 'package:circle/core/di/injection.dart';
import 'package:circle/core/widgets/custom_error_widget.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/data/provider/latest_product_provider.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';
import 'package:circle/features/home/ui/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LatestProductGridView extends StatelessWidget {
  const LatestProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPrefrenceProvider sharedPrefProvider = getIt();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child:
          Consumer<LatestProductProvider>(builder: (context, provider, child) {
        if (provider.isFailure) {
          return CustomErrorWidget(
              errMessage: provider.serverFailure!.errMessage);
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.isLoading ? 2 : provider.productList.length,
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
                        provider.productList[index], context,
                        fromHome: true);
                  },
                  product: provider.productList[index],
                ),
        );
      }),
    );
  }
}
