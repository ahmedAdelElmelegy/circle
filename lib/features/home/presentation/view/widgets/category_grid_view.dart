import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/features/home/presentation/view/widgets/category_item.dart';
import 'package:circle/features/home/presentation/view_model/home_provider.dart';
import 'package:circle/features/products/presentation/view/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: .6,
          crossAxisSpacing: 4.w,
          mainAxisSpacing: 4.h,
        ),
        itemBuilder: (context, index) => provider.isLoading
            ? const LoadingWidget()
            : GestureDetector(
                onTap: () {
                  push(ProductScreen(index: index, subIndex: 0));
                },
                child: CategoryItem(
                  categoryData: provider.categoryList[index],
                ),
              ),
      ),
    );
  }
}
