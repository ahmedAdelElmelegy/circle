import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/payment_provider.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/cash_option.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({super.key});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<PaymentProvider>(context, listen: false);
      provider.getPayment();
    });
    super.initState();
  }

  int currentIndex = 0;
  static List<String> paymentIcon = [
    AppIcons.cashIcon,
    AppIcons.visa,
    AppIcons.masterCard,
    AppIcons.applePay
  ];
  static const List<String> paymentTitle = [
    'cash',
    "visa",
    "master_card",
    "apple_pay"
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculateOrderCostProvider>(context);
    final paymentProvider = Provider.of<PaymentProvider>(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'pay_method'.tr(),
                  style: TextStyles.font18MadaSemiBoldBlack,
                ),
                SvgIcon(AppIcons.closeIcon),
              ],
            ),
            verticalSpace(32),
            Column(
              children: List.generate(
                paymentTitle.length,
                (index) => GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    setState(() {});
                  },
                  child: CashOption(
                    isSelected: currentIndex == index,
                    text: paymentTitle[index],
                    icon: paymentIcon[index],
                  ),
                ),
              ),
            ),
            verticalSpace(32),
            CustomButton(
                title: 'confirm'.tr(),
                onTap: () async {
                  if (currentIndex == 0) {
                    provider.setUpPaymentType('cash');
                    pop();
                  } else if (currentIndex != 0) {
                    provider
                        .setUpPaymentType((paymentTitle[currentIndex]).tr());
                    await launchUrl(
                        Uri.parse(paymentProvider.paymentData!.redirectUrl!));
                  }
                })
          ],
        ),
      ),
    );
  }
}
