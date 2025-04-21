import 'package:circle/core/widgets/custom_error_widget.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/data/provider/product_provider.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';
import 'package:circle/features/home/ui/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatefulWidget {
  final int catId;
  final int subCatId;
  final String title;
  const ProductGridView(
      {super.key,
      required this.catId,
      required this.subCatId,
      required this.title});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  void initState() {
    updateProduct(widget.catId, widget.subCatId, widget.title);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductGridView oldWidget) {
    if (oldWidget.catId != widget.catId ||
        oldWidget.subCatId != widget.subCatId ||
        oldWidget.title != widget.title) {
      updateProduct(widget.catId, widget.subCatId, widget.title);
    }
    super.didUpdateWidget(oldWidget);
  }

  void updateProduct(int catId, int subCatId, String title) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).getProduct(
          {'category_id': catId, 'sub_category_id': subCatId, 'title': title});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<ProductProvider>(builder: (context, provider, child) {
          if (provider.isFailure) {
            return CustomErrorWidget(
                errMessage: provider.serverFailure!.errMessage);
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.productList.length,
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
                      Provider.of<SharedPrefrenceProvider>(context,
                              listen: false)
                          .addToCart(provider.productList[index], context);
                    },
                    product: provider.productList[index],
                  ),
          );
        }));
  }
}
