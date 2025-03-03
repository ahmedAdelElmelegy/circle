import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/cart/ui/cart_screen.dart';
import 'package:circletraning/features/product_details/ui/widgets/price_product_detailes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail-screen';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('product_details', context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              children: [
                Image.asset(
                  Assets.productDetails,
                ),
                verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'meat_and_poultry'.tr(),
                      style: TextStyles.font18MadaSemiBoldBlack
                          .copyWith(color: ColorManger.primary),
                    ),
                    SvgIcon(AppIcons.heartIcon),
                  ],
                ),
                verticalSpace(12),
                Text(
                  'product_description'.tr(),
                  style: TextStyles.font12MadaRegularGray,
                ),
                verticalSpace(12),
                const PriceProductDetails()
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheetWidget(
          isCart: true,
          onTap: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          },
          totalPrice: 250,
        ));
  }
}

class BottomSheetWidget extends StatelessWidget {
  final double totalPrice;
  final String? buttonText;
  final bool? isCart;
  final Function()? onTap;
  const BottomSheetWidget({
    super.key,
    required this.totalPrice,
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
                  'price'.tr(),
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
  final Function()? onTap;
  const AddToCartBotton(
      {super.key, required this.buttonText, this.isCart, this.onTap});

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
                    'add_to_cart'.tr(),
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
