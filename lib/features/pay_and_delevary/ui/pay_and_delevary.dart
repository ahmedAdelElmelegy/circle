import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/data/models/body/calculate_order_cost/calculate_order_cost.dart';
import 'package:circle/data/provider/calculate_order_cost_provider.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';
import 'package:circle/features/address/ui/address_screen.dart';

import 'package:circle/features/pay_and_delevary/ui/widgets/invoice_list_title.dart';
import 'package:circle/features/pay_and_delevary/ui/widgets/pay_and_delevary_list_view.dart';
import 'package:circle/features/pay_and_delevary/ui/widgets/note_text_field.dart';
import 'package:circle/features/pay_and_delevary/ui/widgets/payment_sheet.dart';
import 'package:circle/features/product_details/ui/product_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class PayAndDelevary extends StatelessWidget {
  final double totalPrice;
  final SharedPrefrenceProvider sharedProvider;
  static const String routeName = '/invoice';
  const PayAndDelevary({
    super.key,
    required this.totalPrice,
    required this.sharedProvider,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculateOrderCostProvider>(
      context,
    );

    return Scaffold(
      appBar: customAppBar('pay_and_delevary', context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            verticalSpace(24),
            const PayAndDelevaryListView(),
            verticalSpace(12),
            InvoicListTitle(
              title: 'delivery_address',
              subTitle: provider.fullAddress,
              icon: AppIcons.locationIcon,
              onTap: () {
                push(const AddressScreen());
              },
            ),
            verticalSpace(12),
            InvoicListTitle(
              title: 'payment_method',
              subTitle: provider.payType,
              icon: AppIcons.payIcon,
              onTap: () {
                defaultBottomSheet(context, child: const PaymentBottomSheet());
              },
            ),
            verticalSpace(12),
            NoteTextField(
              controller: provider.noteController,
            ),
            verticalSpace(24)
          ],
        ),
      ),
      bottomSheet: BottomSheetWidget(
        totalPrice: totalPrice.toString(),
        buttonText: 'confirm',
        onTap: () {
          if (provider.position == null) {
            Fluttertoast.showToast(msg: 'no_address_found'.tr());
            return;
          } else {
            provider.calculateOrderCost(CalculateOrderCost(
                latitude: provider.position!.latitude,
                longitude: provider.position!.latitude,
                details: provider.detail));
          }
        },
      ),
    );
  }
}
