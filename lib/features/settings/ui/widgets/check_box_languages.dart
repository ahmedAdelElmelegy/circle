import 'package:circletraning/features/home/ui/widget/check_box_item.dart';
import 'package:flutter/material.dart';

class CheckBoxLanguage extends StatefulWidget {
  const CheckBoxLanguage({super.key});

  @override
  State<CheckBoxLanguage> createState() => _CheckBoxLanguageState();
}

class _CheckBoxLanguageState extends State<CheckBoxLanguage> {
  List<String> cityName = ['arabic', 'english'];

  int _currentIndex = -1;

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
              },
              child: CheckBoxItem(
                cityName: cityName[index],
                isActive: _currentIndex == index,
              ))),
    );
  }
}
