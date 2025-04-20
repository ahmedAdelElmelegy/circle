import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/widgets/custom_error_widget.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/data/provider/category_provider.dart';
import 'package:circle/features/category/ui/widgets/category_item_in_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryListViewInCategory extends StatefulWidget {
  final void Function(int id, int catIndex) updateSubCategory;
  const CategoryListViewInCategory({
    super.key,
    required this.updateSubCategory,
  });

  @override
  State<CategoryListViewInCategory> createState() =>
      _CategoryListViewInCategoryState();
}

class _CategoryListViewInCategoryState
    extends State<CategoryListViewInCategory> {
  int _currentIndex = 0;
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false).getCategory();
    });
    super.didChangeDependencies();
  }

  @override
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
      child: Consumer<CategoryProvider>(builder: (context, provider, child) {
        if (provider.isFailure) {
          return CustomErrorWidget(
              errMessage: provider.serverFailure!.errMessage);
        }
        return ListView.builder(
            itemBuilder: (context, index) => provider.isLoading
                ? LoadingWidget(
                    height: 50.h,
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                      widget.updateSubCategory(
                          provider.categoryList[index].id!, index);
                    },
                    child: CategoryItemInCategory(
                      category: provider.categoryList[index],
                      isSelected: _currentIndex == index,
                    )),
            itemCount: provider.isLoading ? 2 : provider.categoryList.length);
      }),
    );
  }
}
