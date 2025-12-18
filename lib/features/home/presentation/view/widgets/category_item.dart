import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/core/network/models/response/category_model/category_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;
  const CategoryItem({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Container(
              width: 80.w,
              height: 80.h,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: ColorManger.grayLight,
              ),
              child: SizedBox(
                  width: 64.w,
                  height: 64.h,
                  child: CachedImage(image: categoryData.image!)),
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              categoryData.title!,
              maxLines: 2,
              style: TextStyles.font12MadaRegularBlack,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
