import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/features/invoice/ui/widgets/invoice_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceListView extends StatelessWidget {
  const InvoiceListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManger.red.withValues(alpha: .05),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          color: ColorManger.red.withValues(alpha: .1),
          indent: 12.w,
          endIndent: 12.w,
        ),
        itemBuilder: (context, index) => const InvoiceItem(),
        itemCount: 2,
      ),
    );
  }
}
