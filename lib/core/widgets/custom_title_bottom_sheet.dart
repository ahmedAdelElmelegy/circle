import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTitleButtomSheet extends StatelessWidget {
  final String title;
  const CustomTitleButtomSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(),
          style: TextStyles.font14MadaSemiBoldBlack,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgIcon(AppIcons.closeIcon)),
      ],
    );
  }
}
