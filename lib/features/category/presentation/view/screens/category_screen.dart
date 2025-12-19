import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/network_error_screen.dart';
import 'package:circle/features/category/presentation/view/widgets/cateory_list_view_in_category.dart';
import 'package:circle/features/category/presentation/view/widgets/product_list_view_in_cateogry.dart';
import 'package:circle/features/category/presentation/view_model/sub_category_provider.dart';
import 'package:circle/features/home/presentation/view_model/category_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int catId = 44;
  int catInd = 0;
  @override
  Widget build(BuildContext context) {
    final subCategoryProvider = Provider.of<SubCategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Consumer<CategoryProvider>(builder: (context, provider, child) {
          if (provider.isFailure) {
            if (provider.isNetworkError) {
              return CustomErrorScreen(
                  message: 'no_internet_connection'.tr(),
                  onTryAgain: () {
                    provider.getCategory();
                    subCategoryProvider.getsubCategory(catId);
                  });
            }
            return CustomErrorScreen(
                message: provider.serverFailure!.message,
                onTryAgain: () {
                  provider.getCategory();
                  subCategoryProvider.getsubCategory(catId);
                });
          }

          return Skeletonizer(
            enabled: provider.isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.5.h, horizontal: 16.w),
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
          );
        }),
      ),
    );
  }
}
