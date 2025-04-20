import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoclizationCheck {
  static changeLang(BuildContext context) {
    if (saveUserData.getLang() == 'ar') {
      EasyLocalization.of(context)!.setLocale(const Locale('ar', 'EG'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }
}
