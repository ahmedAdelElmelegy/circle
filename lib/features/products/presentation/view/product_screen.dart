import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/home/presentation/view_model/category_provider.dart';
import 'package:circle/features/category/presentation/view_model/sub_category_provider.dart';
import 'package:circle/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:circle/features/products/presentation/view/widgets/category_list_view_in_product_screen.dart';
import 'package:circle/features/products/presentation/view/widgets/list_of_category_item.dart';
import 'package:circle/features/products/presentation/view/widgets/product_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final int? index;
  final int? subIndex;
  const ProductScreen({super.key, this.index, this.subIndex});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int catId = 0;
  int subCategoryId = 0;
  String title = '';

  @override
  void didChangeDependencies() {
    selectCategoryAndSubCategory();

    super.didChangeDependencies();
  }

  void selectCategoryAndSubCategory() {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    final subCategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);

    if (widget.index != null &&
        widget.index! < categoryProvider.categoryList.length) {
      catId = categoryProvider.categoryList[widget.index!].id ?? 0;

      final subCategories =
          categoryProvider.categoryList[widget.index!].subCategories;
      if (subCategories != null && subCategories.isNotEmpty) {
        subCategoryId = subCategories.last.id ?? 0;
      }
    }

    if (widget.subIndex != null && widget.subIndex != 0) {
      if (widget.subIndex! < subCategoryProvider.subCategoryList.length) {
        subCategoryId =
            subCategoryProvider.subCategoryList[widget.subIndex!].id ?? 0;
      }
    }
  }

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
              child: CustomTextField(
                hintText: 'search',
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
            ),
            verticalSpace(8),
            CategoryListViewInProductScreen(
              index: widget.index ?? 0,
              onCategoryTap: (cat, subCat) {
                setState(() {
                  catId = cat;
                  subCategoryId = subCat;
                });
              },
            ),
            verticalSpace(8),
            ListOfCategoryItem(
              onSubCategoryTap: (subCategoryId) {
                setState(() {
                  this.subCategoryId = subCategoryId;
                });
              },
              subIndex: widget.subIndex ?? 0,
              catId: catId,
            ),
            verticalSpace(16),
            ProductGridView(
              catId: catId,
              subCatId: subCategoryId,
              title: title,
            ),
          ],
        ),
      ),
    );
  }
}
