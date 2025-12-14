import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/data/provider/calculate_order_cost_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String)? onChanged;
  final CalculateOrderCostProvider provider;
  const AddressSearchBar(
      {super.key,
      required this.searchController,
      this.onChanged,
      required this.provider});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: searchController,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'search_about_city'.tr(),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: const Icon(Icons.search, color: ColorManger.red),
              border: _border(),
              enabledBorder: _border(),
              focusedBorder: _border(),
            ),
          ),
        ),
        horizontalSpace(8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManger.red,
            minimumSize: Size(48.w, 48.h),
          ),
          onPressed: provider.getAddressFromLatLng,
          child: SvgIcon(AppIcons.singleCheck, width: 12, height: 12),
        ),
      ],
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide.none,
      );
}
