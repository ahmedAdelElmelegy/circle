import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/data/models/response/category_model/category_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemInCategory extends StatelessWidget {
  final bool? isSelected;
  final CategoryData category;
  const CategoryItemInCategory(
      {super.key, this.isSelected = false, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
          width: 78.w,
          decoration: BoxDecoration(
              color: isSelected == true
                  ? ColorManger.red.withValues(alpha: .2)
                  : ColorManger.grayLight,
              border: Border.all(
                  color: isSelected == true
                      ? ColorManger.red.withValues(alpha: .2)
                      : ColorManger.grayLight,
                  width: 1),
              borderRadius: BorderRadius.circular(8.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: CachedImage(image: category.image!)),
                ),
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Text(
                    category.title!,
                    maxLines: 3,
                    style: TextStyles.font12MadaRegularBlack,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
