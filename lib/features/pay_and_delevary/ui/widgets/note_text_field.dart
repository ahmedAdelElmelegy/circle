import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgIcon(AppIcons.notesIcon),
          ),
          hintText: 'notes'.tr(),
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
