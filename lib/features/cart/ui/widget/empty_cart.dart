import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class EmptyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  bool? isFavorite;
  EmptyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return isFavorite == false
        ? Scaffold(
            appBar: customAppBar('cart', context),
            body: Center(
              child: Column(
                children: [
                  verticalSpace(150),
                  Image.asset(
                    image,
                    width: 200.w,
                    height: 200.h,
                  ),
                  verticalSpace(16),
                  Text(
                    title.tr(),
                    style: TextStyles.font16MadaRegularBlack,
                  ),
                  verticalSpace(8),
                  Text(
                    subtitle.tr(),
                    style: TextStyles.font12MadaRegularGray,
                  )
                ],
              ),
            ),
          )
        : Center(
            child: Column(
              children: [
                verticalSpace(150),
                Image.asset(
                  image,
                  width: 200.w,
                  height: 200.h,
                ),
                verticalSpace(16),
                Text(
                  title.tr(),
                  style: TextStyles.font16MadaRegularBlack,
                ),
                verticalSpace(8),
                Text(
                  subtitle.tr(),
                  style: TextStyles.font12MadaRegularGray,
                )
              ],
            ),
          );
  }
}
