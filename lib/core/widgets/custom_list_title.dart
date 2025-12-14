import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final Widget? trailing;
  const CustomListTitle({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgIcon(
        icon,
        width: 20.w,
        height: 20.h,
      ),
      title: Text(
        title.tr(),
        style: TextStyles.font12MadaRegularGray,
      ),
      subtitle: Text(
        subTitle,
        style: TextStyles.font14MadaRegularBlack,
      ),
      trailing: trailing ?? const SizedBox.shrink(),
    );
  }
}
