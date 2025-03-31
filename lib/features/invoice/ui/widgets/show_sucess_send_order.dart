import 'dart:async';

import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/features/orders/ui/orders_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShowSucessSendOrder extends StatefulWidget {
  const ShowSucessSendOrder({
    super.key,
  });

  @override
  State<ShowSucessSendOrder> createState() => _ShowSucessSendOrderState();
}

class _ShowSucessSendOrderState extends State<ShowSucessSendOrder> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, OrdersScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManger.white,
      title: Column(
        children: [
          Image.asset(Assets.doneGIF),
          verticalSpace(12),
          Text(
            'the_request_has_been_sent_successfully'.tr(),
            style: TextStyles.font16MadaRegularBlack
                .copyWith(color: ColorManger.gray),
          ),
        ],
      ),
    );
  }
}
