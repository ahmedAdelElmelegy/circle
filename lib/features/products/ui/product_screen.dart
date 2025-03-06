import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/home/ui/widget/custom_text_field.dart';
import 'package:circletraning/features/home/ui/widget/product_grid_view.dart';
import 'package:circletraning/features/products/ui/widgets/category_list_view_in_product_screen.dart';
import 'package:circletraning/features/products/ui/widgets/list_of_category_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/product-screen';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgIcon(AppIcons.arrowBackIcon),
        ),
        title: Text(
          'prouducts'.tr(),
          style: TextStyles.font18MadaSemiBoldBlack,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomTextField(hintText: 'search'),
            ),
            verticalSpace(8),
            const CategoryListViewInProductScreen(),
            verticalSpace(8),
            const ListOfCategoryItem(),
            verticalSpace(16),
            const ProductGridView(),
          ],
        ),
      ),
    );
  }
}
