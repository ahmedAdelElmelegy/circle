import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DeleteAccountItem extends StatelessWidget {
  final VoidCallback? onPressed;
  const DeleteAccountItem({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgIcon(AppIcons.deleteAccountIcon),
            horizontalSpace(12),
            Text('delete_account'.tr(),
                style: TextStyles.font14MadaSemiBoldBlack.copyWith(
                  color: ColorManger.red,
                )),
          ],
        ),
      ),
    );
  }
}
