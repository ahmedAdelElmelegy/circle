import 'package:circletraning/features/home/ui/widget/category_item.dart';
import 'package:circletraning/features/products/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SizedBox(
          // height: 288.h,
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
            itemBuilder: (context, index) => const CategoryItem(),
          ),
        ),
      ),
    );
  }
}
