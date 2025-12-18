import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/network/models/response/sub_category_model/sub_category_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemOfCategoryProduct extends StatelessWidget {
  final bool? isActive;
  final SubCategoryData subcategory;
  const ItemOfCategoryProduct(
      {super.key, this.isActive = false, required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        // width: 96.w,
        height: 42.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isActive == true ? ColorManger.red : ColorManger.grayLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          subcategory.title!,
          textAlign: TextAlign.center,
          style: isActive == true
              ? TextStyles.font12MadaRegularWhite
              : TextStyles.font12MadaRegularBlack,
        ),
      ),
    );
  }
}
