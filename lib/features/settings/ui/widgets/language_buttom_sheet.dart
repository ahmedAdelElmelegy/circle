import 'package:circletraning/core/helpers/extention.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/widgets/custom_button.dart';
import 'package:circletraning/core/widgets/custom_title_bottom_sheet.dart';
import 'package:circletraning/features/loca.dart';
import 'package:circletraning/features/settings/ui/widgets/check_box_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageButtomSheet extends StatelessWidget {
  const LanguageButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.r),
            topRight: Radius.circular(36.r),
          ),
        ),
        child: Column(
          children: [
            const CustomTitleButtomSheet(
              title: 'language',
            ),
            verticalSpace(24),
            const CheckBoxLanguage(),
            verticalSpace(16),
            CustomButton(
              title: 'confirm',
              onTap: () {
                LoclizationCheck.changeLang(context);
                pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
