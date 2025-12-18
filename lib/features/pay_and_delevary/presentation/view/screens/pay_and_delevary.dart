import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/features/pay_and_delevary/data/models/body/calculate_order_cost.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/screens/address_screen.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:circle/features/cart/presentation/view_model/shared_prefrence_provider.dart';

import 'package:circle/features/pay_and_delevary/presentation/view/widgets/invoice_list_title.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/pay_and_delevary_list_view.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/note_text_field.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/payment_sheet.dart';
import 'package:circle/features/product_details/presentation/view/product_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class PayAndDelevaryScreen extends StatelessWidget {
  final double totalPrice;
  final SharedPrefrenceProvider sharedProvider;
  const PayAndDelevaryScreen({
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  verticalSpace(24),
                  const PayAndDelevaryProductListView(),
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
                      defaultBottomSheet(context,
                          child: const PaymentBottomSheet());
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
          ),
          BottomSheetWidget(
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
        ],
      ),
    );
  }
}
