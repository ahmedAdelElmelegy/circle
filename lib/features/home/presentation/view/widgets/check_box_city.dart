import 'package:circle/features/home/presentation/view/widgets/check_box_item.dart';
import 'package:flutter/material.dart';

class CheckBoxCity extends StatefulWidget {
  const CheckBoxCity({super.key});

  @override
  State<CheckBoxCity> createState() => _CheckBoxCityState();
}

class _CheckBoxCityState extends State<CheckBoxCity> {
  List<String> cityName = ['cairo', 'menoufia'];

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
