import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/widgets/custom_outline_btn.dart';
import 'package:circletraning/data/provider/cancel_order_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditAndRemoveBtn extends StatelessWidget {
  final void Function()? onPressed;
  const EditAndRemoveBtn({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CancelOrderProvider>(builder: (context, provider, child) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        child: Row(
          children: [
            Expanded(
                child: CustomOutLineBtn(
                    onPressed: () {},
                    title: 'edit'.tr(),
                    icon: AppIcons.editIcon)),
            horizontalSpace(8),
            Expanded(
              child: CustomOutLineBtn(
                onPressed: onPressed,
                title: 'cancel'.tr(),
                icon: AppIcons.cancelIcon,
                color: ColorManger.gray,
              ),
            ),
          ],
        ),
      );
    });
  }
}
