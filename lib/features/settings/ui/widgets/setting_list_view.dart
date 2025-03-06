import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/data/models/setting_model.dart';
import 'package:circletraning/features/about/ui/about_screen.dart';
import 'package:circletraning/features/contact_us/ui/contact_us_screen.dart';
import 'package:circletraning/features/profile/ui/edit_profile_screen.dart';
import 'package:circletraning/features/settings/ui/widgets/language_buttom_sheet.dart';
import 'package:circletraning/features/settings/ui/widgets/setting_item.dart';
import 'package:flutter/material.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SettingModel> settingData = [
      SettingModel(() {
        Navigator.pushNamed(context, EditProfileScreen.routeName);
      }, title: 'modify_my_account', icon: AppIcons.editProfileIcon),
      SettingModel(() {
        defaultBottomSheet(context, child: const LanguageButtomSheet());
      }, title: 'language', icon: AppIcons.languageIcon),
      SettingModel(() {
        Navigator.pushNamed(context, ContactUsScreen.routeName);
      }, title: 'connect_us', icon: AppIcons.contactUsIcon),
      SettingModel(() {
        Navigator.pushNamed(context, AboutScreen.routeName);
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
