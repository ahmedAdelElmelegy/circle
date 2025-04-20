import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/extention.dart';
import 'package:circletraning/data/models/setting_model.dart';
import 'package:circletraning/features/about/ui/about_screen.dart';
import 'package:circletraning/features/contact_us/ui/contact_us_screen.dart';
import 'package:circletraning/features/settings/ui/widgets/language_buttom_sheet.dart';
import 'package:circletraning/features/settings/ui/widgets/setting_item.dart';
import 'package:circletraning/features/sign_up/ui/sign_up.dart';
import 'package:circletraning/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SettingModel> settingData = [
      SettingModel(() {
        if (saveUserData.getUserToken() == '') {
          push(const SignUp(
            isEdit: false,
          ));
        } else {
          push(const SignUp(
            isEdit: true,
          ));
        }
      }, title: 'modify_my_account', icon: AppIcons.editProfileIcon),
      SettingModel(() {
        defaultBottomSheet(context, child: const LanguageButtomSheet());
      }, title: 'language', icon: AppIcons.languageIcon),
      SettingModel(() {
        if (saveUserData.getUserToken() != '') {
          push(
            const ContactUsScreen(),
          );
        } else {
          Fluttertoast.showToast(msg: 'please_login_first'.tr());
        }
      }, title: 'connect_us', icon: AppIcons.contactUsIcon),
      SettingModel(() {
        push(
          const AboutScreen(),
        );
      }, title: 'about_this_app', icon: AppIcons.aboutAppIcon),
      SettingModel(() {}, title: 'app_evaluation', icon: AppIcons.rateAppIcon),
    ];
    return Column(
      children: List.generate(
          settingData.length,
          (index) => SettingItem(
                settingData: settingData[index],
              )),
    );
  }
}
