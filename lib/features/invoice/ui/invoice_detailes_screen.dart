import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/custom_button.dart';

import 'package:circletraning/data/models/invoice_model.dart';
import 'package:circletraning/features/invoice/ui/widgets/invoice_detail_item.dart';
import 'package:circletraning/features/invoice/ui/widgets/product_invoice_price.dart';
import 'package:circletraning/features/invoice/ui/widgets/show_sucess_send_order.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceDetailesScreen extends StatelessWidget {
  static const String routeName = 'InvoiceDetailesScreen';
  const InvoiceDetailesScreen({super.key});
  static List<InvoiceModel> item = [
    InvoiceModel(
        title: 'branch', subtitle: 'menoufia', icon: AppIcons.restBranchIcon),
    InvoiceModel(
        title: 'delivery_address',
        subtitle: 'address',
        icon: AppIcons.locationIcon),
    InvoiceModel(
        title: 'pay_method', subtitle: 'menoufia', icon: AppIcons.payIcon),
    InvoiceModel(
        title: 'comments',
        subtitle: 'Bring fresh shrimp',
        icon: AppIcons.notesIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('bill', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InvoiceDetailItem(
                            inviceItem: item[index],
                          );
                        }),
                  ),
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
                          ProductInvicePrice(
                            productName: 'meat_and_poultry'.tr(),
                            prodcutPrice: 'price'.tr(),
                            productCount: '2',
                          ),
                          verticalSpace(12),
                          ProductInvicePrice(
                            productName: 'meat_and_poultry'.tr(),
                            prodcutPrice: 'price'.tr(),
                            productCount: '1',
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
                                    'price'.tr(),
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
                                  Icon(
                                    Icons.check_box_sharp,
                                    color: ColorManger.red,
                                    size: 24.sp,
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
                                        '(130)${tr('points')}'.tr(),
                                        style: TextStyles.font12MadaRegularGray,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'price'.tr(),
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
                                    'price'.tr(),
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
                    showDialog(
                        context: context,
                        builder: (context) => const ShowSucessSendOrder());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
