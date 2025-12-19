import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/features/category/presentation/view_model/sub_category_provider.dart';
import 'package:circle/features/category/presentation/view/widgets/product_item_in_category.dart';
import 'package:circle/features/home/presentation/view_model/category_provider.dart';
import 'package:circle/features/products/presentation/view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductListViewInCategory extends StatefulWidget {
  final int catId;
  final int catIndex;
  const ProductListViewInCategory(
      {super.key, required this.catId, required this.catIndex});

  @override
  State<ProductListViewInCategory> createState() =>
      _ProductListViewInCategoryState();
}

class _ProductListViewInCategoryState extends State<ProductListViewInCategory> {
  @override
  void initState() {
    updateSubCategory(widget.catId);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductListViewInCategory oldWidget) {
    if (oldWidget.catId != widget.catId) {
      updateSubCategory(widget.catId);
    }
    super.didUpdateWidget(oldWidget);
  }

  void updateSubCategory(int id) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SubCategoryProvider>(context, listen: false)
          .getsubCategory(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);

    return Padding(
      padding: EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
      child: provider.isLoading
          ? LoadingWidget(height: 50.h)
          : ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      push(ProductScreen(
                        index: widget.catIndex,
                        subIndex: index,
                      ));
                    },
                    child: ProductItemInCategory(
                      title: provider.subCategoryList[index].title!,
                    ),
                  ),
              itemCount:
                  provider.isLoading ? 2 : provider.subCategoryList.length),
    );
  }
}
