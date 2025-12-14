import 'package:circle/core/theme/styles.dart';
import 'package:circle/features/category/ui/widgets/cateory_list_view_in_category.dart';
import 'package:circle/features/category/ui/widgets/product_list_view_in_cateogry.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int catId = 44;
  int catInd = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.5.h, horizontal: 16.w),
              child: Text(
                'category'.tr(), // ✅ Fix `.tr()` position
                style: TextStyles.font18MadaSemiBoldBlack,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  width: double.infinity, // ✅ Fix infinite width issue
                  child: Row(
                    children: [
                      SizedBox(
                        width: 102.w,
                        child: CategoryListViewInCategory(
                          updateSubCategory: (id, catIndex) {
                            setState(() {
                              catId = id;
                              catInd = catIndex;
                            });
                          },
                        ),
                      ),

                      Expanded(
                          child: ProductListViewInCategory(
                        catIndex: catInd,
                        catId: catId,
                      )), // ✅
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
