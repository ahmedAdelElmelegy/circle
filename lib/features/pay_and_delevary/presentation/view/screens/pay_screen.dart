import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/features/orders/data/models/body/store_order/store_order.dart';

import 'package:circle/features/pay_and_delevary/presentation/view/widgets/pay_details.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/pay_price_detail.dart';
import 'package:circle/features/pay_and_delevary/presentation/view/widgets/pay_product_list_view.dart';
import 'package:circle/features/pay_and_delevary/presentation/view_model/calculate_order_cost_provider.dart';
import 'package:circle/features/orders/presentation/view_model/store_order_provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PayScreen extends StatefulWidget {
  static const String routeName = 'InvoiceDetailesScreen';
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculateOrderCostProvider>(context);
    final storeOrder = Provider.of<StoreOrderProvider>(context);
    return Scaffold(
      appBar: customAppBar('bill', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              child: Column(
                children: [
                  PayDetails(provider: provider),
                  verticalSpace(12),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          color: ColorManger.grayLight,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'prouducts'.tr(),
                            style: TextStyles.font14MadaSemiBoldBlack
                                .copyWith(color: ColorManger.gray),
                          ),
                          verticalSpace(12),
                          PayProductListView(provider: provider),
                          verticalSpace(12),
                          Divider(
                            color: ColorManger.gray.withValues(alpha: .1),
                          ),
                          verticalSpace(12),
                          PayPriceDetail(
                            provider: provider,
                          ),
                        ],
                      )),
                ],
              ),
            ),
            // verticalSpace(39),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                  title: 'send_order',
                  onTap: () {
                    storeOrder.storeOrder(
                        StoreOrder(
                          address: provider.fullAddress,
                          delivery: 1,
                          latitude: provider.position!.latitude,
                          longitude: provider.position!.longitude,
                          details: provider.detail,
                          driverCost: provider
                              .calculateOrderData!.deliveryPrice!
                              .toInt(),
                          isPoints: provider.usePoint,
                          netTotal:
                              provider.calculateOrderData!.netTotal!.toInt(),
                          notes: provider.noteController.text,
                          payType: provider.payType,
                          pointsCount:
                              provider.calculateOrderData!.totalPoints!.toInt(),
                          pointsValue:
                              provider.calculateOrderData!.points!.toInt(),
                          taxValue:
                              provider.calculateOrderData!.taxValue!.toDouble(),
                          grandTotal: provider.usePoint
                              ? provider.calculateOrderData!.grandTotal!
                                      .toDouble() -
                                  provider.calculateOrderData!.totalPoints!
                                      .toDouble()
                              : provider.calculateOrderData!.grandTotal!
                                  .toDouble(),
                        ),
                        context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
