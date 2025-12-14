import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  final Widget? icon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? fillColor;
  final double? borderRadius;
  final int? maxline;
  final Key? formKey;
  final bool? readonly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.onChanged,
      this.icon,
      this.fillColor,
      this.borderRadius,
      this.maxline,
      this.formKey,
      this.validator,
      this.readonly,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        readOnly: readonly ?? false,
        onTap: onTap,
        validator: validator,
        maxLines: maxline ?? 1,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: fillColor == false
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(vertical: 8.h, horizontal: 9.w),
          hintText: hintText.tr(),
          hintStyle: TextStyles.font12MadaRegularGray,
          filled: fillColor ?? true,
          prefixIcon: icon ??
              const Icon(
                Icons.search,
                color: ColorManger.red,
              ),
          border: outLineBorder(ColorManger.grayLight),
          enabledBorder: outLineBorder(ColorManger.grayLight),
          focusedBorder: outLineBorder(ColorManger.red),
          fillColor: ColorManger.grayLight,
        ),
      ),
    );
  }

  OutlineInputBorder outLineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        borderSide:
            fillColor == false ? BorderSide(color: color) : BorderSide.none);
  }
}
