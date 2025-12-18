import 'package:circle/features/home/presentation/view/widgets/check_box_item.dart';
import 'package:circle/main.dart';
import 'package:flutter/material.dart';

class CheckBoxLanguage extends StatefulWidget {
  const CheckBoxLanguage({super.key});

  @override
  State<CheckBoxLanguage> createState() => _CheckBoxLanguageState();
}

class _CheckBoxLanguageState extends State<CheckBoxLanguage> {
  List<String> cityName = ['arabic', 'english'];
  @override
  void initState() {
    _currentIndex = saveUserData.getLang() == 'ar' ? 0 : 1;
    super.initState();
  }

  int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          cityName.length,
          (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
                if (index == 0) {
                  saveUserData.saveLang('ar');
                } else {
                  saveUserData.saveLang('en');
                }
              },
              child: CheckBoxItem(
                cityName: cityName[index],
                isActive: _currentIndex == index,
              ))),
    );
  }
}
