import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/core/network/models/response/category_model/category_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemInProductScreen extends StatelessWidget {
  final bool? isActive;
  final CategoryData category;
  const CategoryItemInProductScreen(
      {super.key, this.isActive = false, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManger.red.withValues(alpha: .01),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: isActive == true
                  ? ColorManger.red.withValues(alpha: .1)
                  : ColorManger.red.withValues(alpha: .01),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                  color: isActive == true
                      ? ColorManger.red
                      : ColorManger.red.withValues(alpha: .01),
                  width: 1)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: CachedImage(image: category.image!),
                ),
                Text(
                  category.title!,
                  style: TextStyles.font12MadaRegularBlack,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
