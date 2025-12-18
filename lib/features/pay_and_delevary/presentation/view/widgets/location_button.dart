import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/theme/color_manager.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final Function() initUserLocation;
  final bool isLoadingLocation;
  const LocationButton(
      {super.key,
      required this.initUserLocation,
      required this.isLoadingLocation});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: ColorManger.red,
      onPressed: initUserLocation,
      icon: isLoadingLocation
          ? const CircularProgressIndicator(color: Colors.white)
          : SvgIcon(AppIcons.myLocation, color: Colors.white),
      label: Text(
        'my_location'.tr(),
        style: TextStyles.font14MadaRegularWith,
      ),
    );
  }
}
