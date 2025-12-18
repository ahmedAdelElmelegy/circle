import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/features/orders/presentation/view_model/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderBtns extends StatelessWidget {
  const OrderBtns({
    super.key,
  });

  static List<String> title = const ['current', 'previous'];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    return SizedBox(
      height: 53.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(), // Allow natural scrolling
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: CustomButton(
              onTap: () {
                provider.statusOfOrder(index);
              },
              title: title[index],
              isSelect: provider.currentIndex == index,
              width: 166.w,
            ),
          );
        },
      ),
    );
  }
}
