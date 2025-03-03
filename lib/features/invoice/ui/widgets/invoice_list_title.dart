import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/features/invoice/ui/widgets/custom_continer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoicListTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final Function()? onTap;
  final bool? notraling;
  final Color? color;
  const InvoicListTitle({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.onTap,
    this.notraling = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        color: color,
        child: ListTile(
          leading: SvgIcon(
            icon,
            width: 20.w,
            height: 20.h,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: TextStyles.font12MadaRegularBlack,
              ),
              Text(
                subTitle.tr(),
                style: TextStyles.font14MadaRegularBlack,
              ),
            ],
          ),
          trailing: notraling == true
              ? InkWell(
                  onTap: onTap, child: const Icon(Icons.arrow_forward_ios))
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
