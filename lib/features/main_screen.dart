import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/provider/home_provider.dart';
import 'package:circletraning/features/category/ui/category_screen.dart';
import 'package:circletraning/features/home/ui/home_screen.dart';
import 'package:circletraning/features/map/ui/map_screen.dart';
import 'package:circletraning/features/settings/ui/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/main-screen';
  const MainScreen({super.key});

  static const List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    MapScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 64.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomNavBar(
                  onTap: () => homeProvider.setIndex(0),
                  icon: homeProvider.currentIndex == 0
                      ? AppIcons.homeIconSelected
                      : AppIcons.homeIcon),
              _buildBottomNavBar(
                  onTap: () => homeProvider.setIndex(1),
                  icon: homeProvider.currentIndex == 1
                      ? AppIcons.categoryIconSelected
                      : AppIcons.categoryIcon),
              _buildBottomNavBar(
                  onTap: () => homeProvider.setIndex(2),
                  icon: homeProvider.currentIndex == 2
                      ? AppIcons.mapIconSelected
                      : AppIcons.mapIcon),
              _buildBottomNavBar(
                  onTap: () => homeProvider.setIndex(3),
                  icon: homeProvider.currentIndex == 3
                      ? AppIcons.settingsIconSelected
                      : AppIcons.settingsIcon),
            ],
          ),
        ),
        body: SafeArea(child: screens[homeProvider.currentIndex]),
      );
    });
  }

  Widget _buildBottomNavBar({required String icon, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SvgIcon(icon),
    );
  }
}
