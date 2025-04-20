import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:circletraning/core/widgets/loading_widget.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/features/products/ui/widgets/category_item_in_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryListViewInProductScreen extends StatefulWidget {
  final int index;
  final void Function(int cat, int subCat)? onCategoryTap;

  const CategoryListViewInProductScreen({
    super.key,
    this.onCategoryTap,
    required this.index,
  });

  @override
  State<CategoryListViewInProductScreen> createState() =>
      _CategoryListViewInProductScreenState();
}

class _CategoryListViewInProductScreenState
    extends State<CategoryListViewInProductScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: Consumer<CategoryProvider>(builder: (context, provider, child) {
        if (provider.isFailure) {
          return CustomErrorWidget(
              errMessage: provider.serverFailure!.errMessage);
        }
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => provider.isLoading
                ? LoadingWidget(
                    width: 50.w,
                    height: 50.h,
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                      widget.onCategoryTap!(
                          provider.categoryList[index].id!,
                          provider
                              .categoryList[index]
                              .subCategories![provider.categoryList[index]
                                      .subCategories!.length -
                                  1]
                              .id!);
                    },
                    child: CategoryItemInProductScreen(
                      category: provider.categoryList[index],
                      isActive: _currentIndex == index,
                    ),
                  ),
            itemCount: provider.isLoading ? 2 : provider.categoryList.length);
      }),
    );
  }
}
