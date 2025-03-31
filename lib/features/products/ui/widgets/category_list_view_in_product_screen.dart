import 'package:circletraning/features/products/ui/widgets/category_item_in_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListViewInProductScreen extends StatefulWidget {
  const CategoryListViewInProductScreen({
    super.key,
  });

  @override
  State<CategoryListViewInProductScreen> createState() =>
      _CategoryListViewInProductScreenState();
}

class _CategoryListViewInProductScreenState
    extends State<CategoryListViewInProductScreen> {
  int _currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: CategoryItemInProductScreen(
                  isActive: _currentIndex == index,
                ),
              ),
          itemCount: 10),
    );
  }
}
