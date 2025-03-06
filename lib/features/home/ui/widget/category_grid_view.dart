import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:circletraning/data/datasource/remote/exeption/api_error_handeler.dart';
import 'package:circletraning/data/provider/category_provider.dart';
import 'package:circletraning/features/home/ui/widget/category_item.dart';
import 'package:circletraning/features/products/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
          child:
              Consumer<CategoryProvider>(builder: (context, provider, child) {
            if (provider.isFailure) {
              return CustomErrorWidget(
                  errMessage:
                      ApiErrorHandler.getMessage(provider.apiErrorHandler));
            }
            return GridView.builder(
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
            );
          }),
        ),
      ),
    );
  }
}
