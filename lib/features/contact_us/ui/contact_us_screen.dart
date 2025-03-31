import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/widgets/custom_button.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/home/ui/widget/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  static const routeName = '/contact-us';
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('connect_us', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              SvgIcon(
                AppIcons.connectUsIcon,
                width: 196.w,
                height: 150.h,
              ),
              verticalSpace(48),
              CustomTextField(
                hintText: 'my_name',
                fillColor: false,
                borderRadius: 0.r,
                icon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgIcon(AppIcons.name),
                ),
              ),
              verticalSpace(12),
              CustomTextField(
                hintText: 'my_email',
                fillColor: false,
                borderRadius: 0.r,
                icon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgIcon(AppIcons.emailIcon),
                ),
              ),
              verticalSpace(12),
              CustomTextField(
                hintText: 'my_phone',
                fillColor: false,
                borderRadius: 0.r,
                icon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgIcon(AppIcons.noteTitleIcon),
                ),
              ),
              verticalSpace(12),
              CustomTextField(
                // maxline: 5,
                hintText: 'address_message',
                fillColor: false,
                borderRadius: 0.r,
                icon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgIcon(AppIcons.notesIcon),
                ),
              ),
              verticalSpace(100),
              CustomButton(
                title: 'send',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(color: ColorManger.grayLight),
    );
  }
}
