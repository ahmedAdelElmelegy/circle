import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/extention.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/data/models/setting_model.dart';
import 'package:circletraning/features/favorite/ui/favorite_screen.dart';
import 'package:circletraning/features/orders/ui/orders_screen.dart';
import 'package:circletraning/features/points/ui/points_screen.dart';
import 'package:circletraning/features/settings/ui/widgets/column_in_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointAndFavAndOrder extends StatelessWidget {
  const PointAndFavAndOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SettingModel> settings = [
      SettingModel(
        () {
          push(const OrdersScreen());
        },
        title: 'my_orders',
        icon: AppIcons.ordersIcon,
      ),
      SettingModel(
        () {
          push(const FavoriteScreen());
        },
        title: 'favorite',
        icon: AppIcons.favoritesIcon,
      ),
      SettingModel(
        () {
          push(const PointsScreen());
        },
        title: 'points',
        icon: AppIcons.pointsIcon,
      ),
    ];
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorManger.grayLight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              settings.length,
              (index) => GestureDetector(
                    onTap: settings[index].onTap,
                    child: ColumnInSetting(
                      settingModel: settings[index],
                    ),
                  )),
        ));
  }
}
