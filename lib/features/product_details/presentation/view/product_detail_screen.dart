import 'package:circle/core/di/injection.dart';
import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:circle/features/products/data/models/product_model/product_model_data.dart';
import 'package:circle/features/cart/presentation/view_model/shared_prefrence_provider.dart';
import 'package:circle/features/product_details/presentation/view/widgets/price_product_detailes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

SharedPrefrenceProvider provider = getIt();

class ProductDetailScreen extends StatefulWidget {
  final ProductModelData product;
  static const routeName = '/product-detail-screen';
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<SharedPrefrenceProvider>(
        builder: (context, provider, child) {
      return Scaffold(
          appBar: customAppBar('product_details', context),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 343.w,
                    height: 234.h,
                    child: CachedImage(
                      image: widget.product.image!,
                    ),
                  ),
                  verticalSpace(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title!,
                        style: TextStyles.font18MadaSemiBoldBlack
                            .copyWith(color: ColorManger.primary),
                      ),
                      SvgIcon(AppIcons.heartIcon),
                    ],
                  ),
                  verticalSpace(12),
                  SizedBox(
                    height: 150.h,
                    child: Text(
                      widget.product.details!,
                      style: TextStyles.font12MadaRegularGray,
                    ),
                  ),
                  verticalSpace(12),
                  PriceProductDetails(
                    increaseCart: () {
                      setState(() {
                        widget.product.weightUnit =
                            widget.product.weightUnit! + 1;
                        setState(() {});
                      });
                    },
                    decreaseCart: () {
                      if (widget.product.weightUnit! > 1) {
                        setState(() {
                          widget.product.weightUnit =
                              widget.product.weightUnit! - 1;
                        });
                      }
                    },
                    count: widget.product.weightUnit!,
                    price: widget.product.price.toString(),
                  )
                ],
              ),
            ),
          ),
          bottomSheet: BottomSheetWidget(
            isCart: true,
            onTap: () {
              provider.addToCart(widget.product, context);
            },
            inCart: provider.isProductInCart(widget.product),
            totalPrice: provider.totalProductPrice(widget.product).toString(),
          ));
    });
  }
}

class BottomSheetWidget extends StatelessWidget {
  final String totalPrice;
  final String? buttonText;
  final bool? isCart;
  final bool? inCart;
  final Function()? onTap;
  const BottomSheetWidget({
    super.key,
    required this.totalPrice,
    this.inCart,
    this.buttonText = 'add_to_cart',
    this.isCart = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 24,
                color: ColorManger.grayMaidum,
              )
            ],
            color: ColorManger.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'total'.tr(),
                  style: TextStyles.font12MadaRegularBlack,
                ),
                horizontalSpace(4),
                Text(
                  totalPrice,
                  style: TextStyles.font18MadaSemiBoldBlack,
                ),
                horizontalSpace(4.5),
                Text(
                  'egp'.tr(),
                  style: TextStyles.font12MadaRegularBlack,
                ),
              ],
            ),
            AddToCartBotton(
              onTap: onTap,
              buttonText: buttonText!,
              isCart: isCart,
              inCart: inCart,
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartBotton extends StatelessWidget {
  final String buttonText;
  final bool? isCart;
  final bool? inCart;
  final Function()? onTap;
  const AddToCartBotton(
      {super.key,
      required this.buttonText,
      this.isCart,
      this.onTap,
      this.inCart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r), color: ColorManger.red),
        child: isCart == true
            ? Row(
                children: [
                  SvgIcon(AppIcons.addCartIcon),
                  horizontalSpace(8),
                  Text(
                    inCart == true ? 'in_cart'.tr() : 'add_to_cart'.tr(),
                    style: TextStyles.font14MadaRegularWith,
                  ),
                ],
              )
            : Text(
                buttonText.tr(),
                style: TextStyles.font14MadaRegularWith,
              ),
      ),
    );
  }
}
