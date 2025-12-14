import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<dynamic> defaultBottomSheet(BuildContext context,
    {required Widget child}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => child,
  );
}

AppBar customAppBar(String title, BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgIcon(AppIcons.arrowBackIcon)),
    title: Text(
      title.tr(),
      style: TextStyles.font18MadaSemiBoldBlack,
    ),
  );
}

AppBar customAppBarWithNavigation(
    String title, Function() onBack, BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: () => onBack(), icon: SvgIcon(AppIcons.arrowBackIcon)),
    title: Text(
      title.tr(),
      style: TextStyles.font18MadaSemiBoldBlack,
    ),
  );
}

AppBar customAppBarWithoutLeading(String title, BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    title: Text(
      title.tr(),
      style: TextStyles.font18MadaSemiBoldBlack,
    ),
  );
}
