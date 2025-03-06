import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        maxLines: 5,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: 'notes'.tr(),
          prefixIconConstraints: BoxConstraints(
            minHeight: 20.h,
            minWidth: 20.w,
          ),
          hintStyle: TextStyles.font14MadaRegularBlack
              .copyWith(color: ColorManger.gray),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                const BorderSide(color: ColorManger.grayLight, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                const BorderSide(color: ColorManger.grayLight, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                const BorderSide(color: ColorManger.grayLight, width: 1),
          ),
        ),
      ),
    );
  }
}
