import 'package:circle/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointCheckBox extends StatefulWidget {
  final void Function(bool value) onPointTaped;
  const PointCheckBox({super.key, required this.onPointTaped});

  @override
  State<PointCheckBox> createState() => _PointCheckBoxState();
}

class _PointCheckBoxState extends State<PointCheckBox> {
  bool checkvalue = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      height: 24.h,
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        activeColor: ColorManger.red,
        value: checkvalue,
        onChanged: (value) {
          setState(() {
            checkvalue = value!;
          });
          widget.onPointTaped(value!);
        },
      ),
    );
  }
}
