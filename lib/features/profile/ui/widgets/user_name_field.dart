import 'package:circle/core/theme/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNameField extends StatelessWidget {
  final String title;
  final Key? formKey;

  final String? Function(String?)? validator;

  final TextEditingController? controller;
  const UserNameField(
      {super.key,
      required this.title,
      this.controller,
      this.validator,
      this.formKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 167.w,
        child: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              // constraints: BoxConstraints(minHeight: 24.h, maxHeight: 24.h),
              labelText: title.tr(),
              border: outLineBorder(),
              enabledBorder: outLineBorder(),
              focusedBorder: outLineBorder(),
            ),
          ),
        ));
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorManger.red,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(12.r),
    );
  }
}
