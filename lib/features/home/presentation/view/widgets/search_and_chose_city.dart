import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/features/home/presentation/view/widgets/chose_city.dart';
import 'package:circle/features/home/presentation/view/widgets/chose_city_bottom_sheet.dart';
import 'package:circle/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:circle/features/products/presentation/view/product_screen.dart';
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
          Expanded(
            child: CustomTextField(
              readonly: true,
              onTap: () {
                push(const ProductScreen(index: 0, subIndex: 0));
              },
              hintText: 'search',
            ),
          ),
        ],
      ),
    );
  }
}
