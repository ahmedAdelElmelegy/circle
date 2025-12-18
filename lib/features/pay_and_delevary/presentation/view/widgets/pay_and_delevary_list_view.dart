import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/features/cart/presentation/view_model/shared_prefrence_provider.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/invoice_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PayAndDelevaryProductListView extends StatefulWidget {
  const PayAndDelevaryProductListView({
    super.key,
  });

  @override
  State<PayAndDelevaryProductListView> createState() =>
      _PayAndDelevaryListViewState();
}

class _PayAndDelevaryListViewState
    extends State<PayAndDelevaryProductListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SharedPrefrenceProvider>(
        builder: (context, provider, child) {
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
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: PayAndDelevaryItem(
              product: provider.cartItems[index],
            ),
          ),
          itemCount: provider.cartItems.length,
        ),
      );
    });
  }
}
