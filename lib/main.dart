import 'package:circle/core/di/injection.dart';
import 'package:circle/data/repository/save_user_data.dart';
import 'package:circle/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
SaveUserData saveUserData = getIt();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // initgit push origin --delete master
  init();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'EG'),
        startLocale: const Locale('ar', 'EG'),
        child: const MyApp()),
  );
  // ui finished loading
}
