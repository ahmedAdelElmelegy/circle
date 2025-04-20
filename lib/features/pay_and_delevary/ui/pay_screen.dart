import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/custom_button.dart';
import 'package:circle/data/models/body/store_order/store_order.dart';

import 'package:circle/data/models/invoice_model.dart';
import 'package:circle/data/provider/calculate_order_cost_provider.dart';
import 'package:circle/data/provider/store_order_provider.dart';
import 'package:circle/features/pay_and_delevary/ui/widgets/pay_item.dart';
import 'package:circle/features/pay_and_delevary/ui/widgets/point_check_box.dart';
import 'package:circle/features/pay_and_delevary/ui/widgets/product_invoice_price.dart';
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
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: ColorManger.red.withValues(alpha: 0.08)),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                      child: Column(
                        children: [
                          PayItem(
                            inviceItem: InvoiceModel(
                                title: 'branch',
                                subtitle: 'menoufia',
                                icon: AppIcons.restBranchIcon),
                          ),
                          verticalSpace(12),
                          PayItem(
                            inviceItem: InvoiceModel(
                                title: 'delivery_address',
                                subtitle: provider.fullAddress,
                                icon: AppIcons.locationIcon),
                          ),
                          verticalSpace(12),
                          PayItem(
                            inviceItem: InvoiceModel(
                                title: 'pay_method',
                                subtitle: provider.payType,
                                icon: AppIcons.payIcon),
                          ),
                          verticalSpace(12),
                          PayItem(
                            inviceItem: InvoiceModel(
                                title: 'comments',
                                subtitle: provider.noteController.text,
                                icon: AppIcons.notesIcon),
                          )
                        ],
                      )),
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
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ProductInvicePrice(
                                productName:
                                    provider.shared.cartItems[index].title!,
                                prodcutPrice: provider
                                    .shared.cartItems[index].price!
                                    .toString(),
                                productCount: provider
                                    .shared.cartItems[index].weightUnit!
                                    .toString(),
                              );
                            },
                            itemCount: provider.shared.cartItems.length,
                          ),
                          verticalSpace(12),
                          Divider(
                            color: ColorManger.gray.withValues(alpha: .1),
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'delivery'.tr(),
                                style: TextStyles.font12MadaRegularGray,
                              ),
                              Row(
                                children: [
                                  Text(
                                    provider.calculateOrderData!.deliveryPrice
                                        .toString(),
                                    style: TextStyles.font16MadaSemiBoldBlack,
                                  ),
                                  horizontalSpace(6),
                                  Text(
                                    'egp'.tr(),
                                    style: TextStyles.font12MadaRegularGray,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          verticalSpace(12),
                          Divider(
                            color: ColorManger.gray.withValues(alpha: .1),
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  PointCheckBox(
                                    onPointTaped: (value) {
                                      provider.usePoint = value;
                                      setState(() {});
                                    },
                                  ),
                                  horizontalSpace(12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'use_points'.tr(),
                                        style: TextStyles.font12MadaRegularGray,
                                      ),
                                      verticalSpace(2),
                                      Text(
                                        provider.calculateOrderData!.points
                                            .toString(),
                                        style: TextStyles.font12MadaRegularGray,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    provider.calculateOrderData!.totalPoints
                                        .toString(),
                                    style: TextStyles.font16MadaSemiBoldBlack,
                                  ),
                                  horizontalSpace(6),
                                  Text(
                                    'egp'.tr(),
                                    style: TextStyles.font12MadaRegularGray,
                                  ),
                                ],
                              )
                            ],
                          ),
                          verticalSpace(12),
                          Divider(
                            color: ColorManger.gray.withValues(alpha: .1),
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'total'.tr(),
                                style: TextStyles.font14MadaSemiBoldBlack,
                              ),
                              Row(
                                children: [
                                  Text(
                                    provider.calculateOrderData!.grandTotal
                                        .toString(),
                                    style: TextStyles.font18MadaSemiBoldBlack
                                        .copyWith(color: ColorManger.red),
                                  ),
                                  horizontalSpace(6),
                                  Text(
                                    'egp'.tr(),
                                    style: TextStyles.font12MadaRegularRed,
                                  ),
                                ],
                              ),
                            ],
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
                  title: 'send_order'.tr(),
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
