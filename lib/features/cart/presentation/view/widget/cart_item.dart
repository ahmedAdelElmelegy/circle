import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/products/data/models/product_model/product_model_data.dart';
import 'package:circle/features/cart/presentation/view/widget/counter_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final ProductModelData product;
  final void Function()? deleteProduct;
  final void Function()? increamentQuantity;
  final void Function()? decreamentQuantity;
  final num totalProductPrice;
  const CartItem(
      {super.key,
      required this.product,
      this.deleteProduct,
      this.increamentQuantity,
      this.decreamentQuantity,
      required this.totalProductPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 100.w,
                  height: 66.h,
                  child: CachedImage(image: product.image!)),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      product.title!,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14MadaSemiBoldBlack,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgIcon(
                        AppIcons.priceIcon,
                        width: 16.w,
                        height: 16.h,
                      ),
                      horizontalSpace(4),
                      Text(
                        product.price!.toString(),
                        style: TextStyles.font16MadaSemiBoldBlack,
                      ),
                      horizontalSpace(4),
                      Text(
                        'egp'.tr(),
                        style: TextStyles.font12MadaRegularBlack,
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: deleteProduct,
                child: SvgIcon(
                  AppIcons.deleteIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: decreamentQuantity,
                          child: const CounterButton(
                            icon: Icons.remove,
                          ),
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorManger.white,
                                border: Border.all(
                                    color: ColorManger.grayLight, width: 1),
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 12.h),
                              child: Text(
                                product.weightUnit.toString(),
                                style: TextStyles.font16MadaSemiBoldBlack,
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        GestureDetector(
                          onTap: increamentQuantity,
                          child: const CounterButton(
                            icon: Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(16),
                Column(
                  children: [
                    Text(
                      'total'.tr(),
                      style: TextStyles.font12MadaRegularBlack,
                    ),
                    verticalSpace(4),
                    Row(
                      children: [
                        Text(
                          totalProductPrice.toString(),
                          style: TextStyles.font18MadaSemiBoldBlack
                              .copyWith(color: ColorManger.red),
                        ),
                        horizontalSpace(4),
                        Text(
                          'egp'.tr(),
                          style: TextStyles.font12MadaRegularRed,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
