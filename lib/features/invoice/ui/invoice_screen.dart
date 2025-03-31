import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/invoice/ui/invoice_detailes_screen.dart';
import 'package:circletraning/features/invoice/ui/widgets/invoice_list_title.dart';
import 'package:circletraning/features/invoice/ui/widgets/invoice_list_view.dart';
import 'package:circletraning/features/invoice/ui/widgets/note_text_field.dart';
import 'package:circletraning/features/invoice/ui/widgets/payment_bottom_sheet.dart';
import 'package:circletraning/features/product_details/ui/product_detail_screen.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  static const String routeName = '/invoice';
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('pay_and_delevary', context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            verticalSpace(24),
            const InvoiceListView(),
            verticalSpace(12),
            InvoicListTitle(
              title: 'delivery_address',
              subTitle: 'address',
              icon: AppIcons.locationIcon,
              onTap: () {},
            ),
            verticalSpace(12),
            InvoicListTitle(
              title: 'payment_method',
              subTitle: 'cash',
              icon: AppIcons.payIcon,
              onTap: () {
                defaultBottomSheet(context, child: const PaymentBottomSheet());
              },
            ),
            verticalSpace(12),
            const NoteTextField(),
            verticalSpace(24)
          ],
        ),
      ),
      bottomSheet: BottomSheetWidget(
        totalPrice: 250,
        buttonText: 'confirm',
        onTap: () {
          Navigator.pushNamed(context, InvoiceDetailesScreen.routeName);
        },
      ),
    );
  }
}
