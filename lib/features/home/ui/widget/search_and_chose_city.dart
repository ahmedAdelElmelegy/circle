import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/home/ui/widget/chose_city.dart';
import 'package:circletraning/features/home/ui/widget/chose_city_bottom_sheet.dart';
import 'package:circletraning/features/home/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndChoseCity extends StatelessWidget {
  const SearchAndChoseCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                defaultBottomSheet(context,
                    child: const ChoseCityBottomSheet());
              },
              child: const ChoseCity()),
          horizontalSpace(10),
          const Expanded(
            child: CustomTextField(
              hintText: 'search',
            ),
          ),
        ],
      ),
    );
  }
}
