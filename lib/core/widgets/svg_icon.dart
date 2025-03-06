import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String _assets;
  final double? _height;
  final double? _width;
  final Color? _color;

  const SvgIcon(String assets,
      {super.key, Color? color, double? height, double? width})
      : _assets = assets,
        _height = height,
        _width = width,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width ?? 24.w,
      height: _height ?? 24.h,
      child: SvgPicture.asset(
        _assets,
        width: _width ?? 24.w,
        height: _height ?? 24.h,
        colorFilter:
            _color != null ? ColorFilter.mode(_color, BlendMode.srcIn) : null,
      ),
    );
  }
}
