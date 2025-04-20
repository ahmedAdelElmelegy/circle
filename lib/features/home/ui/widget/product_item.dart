import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/data/models/response/product_model/product_model_data.dart';
import 'package:circle/data/provider/add_and_remove_provider.dart';
import 'package:circle/data/provider/shared_prefrence_provider.dart';
import 'package:circle/features/home/ui/widget/discount_item.dart';
import 'package:circle/features/home/ui/widget/product_icon.dart';
import 'package:circle/features/product_details/ui/product_detail_screen.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final ProductModelData? product;
  final void Function()? onTap;

  const ProductItem({super.key, this.product, this.onTap});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(ProductDetailScreen(
          product: widget.product!,
        ));
      },
      child: Consumer<SharedPrefrenceProvider>(
          builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorManger.grayLight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                        width: 134.w,
                        height: 90.h,
                        child: CachedImage(image: widget.product!.image!)),
                    Positioned(
                      top: -8.h,
                      right: -8.w,
                      child: GestureDetector(
                        onTap: () {
                          if (saveUserData.getUserToken() == '') {
                            Fluttertoast.showToast(
                                msg: 'please_login_first'.tr());
                          } else {
                            setState(() {
                              widget.product!.isFavorite =
                                  !widget.product!.isFavorite!;
                            });
                            Provider.of<AddAndRemovFavoriteeProvider>(context,
                                    listen: false)
                                .addAndRemoveFavorite(
                                    widget.product!.id!.toInt());
                          }
                        },
                        child: ProductIcons(
                          iconColor: widget.product!.isFavorite!
                              ? ColorManger.red
                              : ColorManger.grayLight,
                          icon: AppIcons.heartIcon,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.product!.isOffer ?? false,
                      child: Positioned(
                        top: -8.h,
                        left: -8.w,
                        child: DiscountItem(
                          offerValue: widget.product!.offerValue.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(8),
              Text(
                widget.product!.title!,
                maxLines: 1,
                style: TextStyles.font14MadaRegularBlack,
              ),
              verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.product!.price!.toString(),
                        style: TextStyles.font16MadaSemiBoldBlack,
                      ),
                      horizontalSpace(4),
                      Text(
                        tr('egp'),
                        style: TextStyles.font10MadaRegularBlack,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: ProductIcons(
                      icon: provider.isProductInCart(widget.product!)
                          ? AppIcons.check
                          : AppIcons.addCartIcon,
                      iconColor: Colors.white,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
