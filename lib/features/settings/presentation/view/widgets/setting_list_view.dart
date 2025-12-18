import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/core/helpers/constants.dart';
import 'package:circle/core/helpers/extention.dart';
import 'package:circle/features/settings/data/models/setting_model.dart';
import 'package:circle/features/about/presentation/view/screens/about_screen.dart';
import 'package:circle/features/contact_us/presentation/view/screens/contact_us_screen.dart';
import 'package:circle/features/settings/presentation/view/widgets/language_buttom_sheet.dart';
import 'package:circle/features/settings/presentation/view/widgets/setting_item.dart';
import 'package:circle/features/sign_up/presentation/view/sign_up.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingActionListView extends StatelessWidget {
  const SettingActionListView({
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
          (index) => SettingActionItem(
                settingData: settingData[index],
              )),
    );
  }
}
