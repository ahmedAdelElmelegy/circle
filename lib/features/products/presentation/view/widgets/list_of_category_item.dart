import 'package:circle/core/widgets/custom_error_widget.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/features/category/presentation/view_model/sub_category_provider.dart';
import 'package:circle/features/home/presentation/view_model/category_provider.dart';
import 'package:circle/features/products/presentation/view/widgets/item_of_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ListOfCategoryItem extends StatefulWidget {
  final int catId;
  final int subIndex;
  final void Function(int subCategoryId)? onSubCategoryTap;
  const ListOfCategoryItem({
    super.key,
    required this.catId,
    required this.subIndex,
    this.onSubCategoryTap,
  });

  @override
  State<ListOfCategoryItem> createState() => _ListOfCategoryItemState();
}

class _ListOfCategoryItemState extends State<ListOfCategoryItem> {
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.subIndex;
    updateSubCategory(widget.catId);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ListOfCategoryItem oldWidget) {
    if (oldWidget.catId != widget.catId) {
      updateSubCategory(widget.catId);
      _currentIndex = 0;
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
    return SizedBox(
      height: 56.h,
      child: Consumer<SubCategoryProvider>(builder: (context, provider, child) {
        if (provider.isFailure) {
          return CustomErrorWidget(
              errMessage: provider.serverFailure!.errMessage);
        }

        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => provider.isLoading
                ? LoadingWidget(
                    width: 100.w,
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                      widget.onSubCategoryTap!(
                          provider.subCategoryList[index].id!);
                    },
                    child: ItemOfCategoryProduct(
                      subcategory: provider.subCategoryList[index],
                      isActive: _currentIndex == index,
                    ),
                  ),
            itemCount: provider.subCategoryList.length);
      }),
    );
  }
}
