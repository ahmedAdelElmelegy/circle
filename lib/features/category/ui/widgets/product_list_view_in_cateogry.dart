import 'package:circletraning/features/category/ui/widgets/product_item_in_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListViewInCategory extends StatelessWidget {
  const ProductListViewInCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, top: 12.h, bottom: 12.h),
      child: ListView.builder(
          itemBuilder: (context, index) => const ProductItemInCategory(),
          itemCount: 10),
    );
  }
}
