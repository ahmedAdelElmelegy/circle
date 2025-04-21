import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/core/widgets/custom_title_bottom_sheet.dart';
import 'package:circle/features/loca.dart';
import 'package:circle/features/main_screen.dart';
import 'package:circle/features/settings/ui/widgets/check_box_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
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

                push(const MainScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
