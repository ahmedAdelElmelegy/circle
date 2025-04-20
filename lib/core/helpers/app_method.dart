import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
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
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgIcon(AppIcons.arrowBackIcon)),
    title: Text(
      title.tr(),
      style: TextStyles.font18MadaSemiBoldBlack,
    ),
  );
}

AppBar customAppBarWithoutLeading(String title, BuildContext context) {
  return AppBar(
    title: Text(
      title.tr(),
      style: TextStyles.font18MadaSemiBoldBlack,
    ),
  );
}
