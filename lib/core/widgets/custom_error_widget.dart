import 'package:circle/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errMessage})
      : super(key: key);
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: TextStyles.font14MadaRegularBlack,
        textAlign: TextAlign.center,
      ),
    );
  }
}
