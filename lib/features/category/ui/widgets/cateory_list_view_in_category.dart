import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/features/category/ui/widgets/category_item_in_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListViewInCategory extends StatefulWidget {
  const CategoryListViewInCategory({
    super.key,
  });

  @override
  State<CategoryListViewInCategory> createState() =>
      _CategoryListViewInCategoryState();
}

class _CategoryListViewInCategoryState
    extends State<CategoryListViewInCategory> {
  int _currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.only(right: 16.w, left: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r)),
          color: ColorManger.grayLight),
      child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: CategoryItemInCategory(
                isSelected: _currentIndex == index,
              )),
          itemCount: 10),
    );
  }
}
