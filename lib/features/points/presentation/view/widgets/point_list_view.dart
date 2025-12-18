import 'package:circle/core/helpers/spacing.dart';
import 'package:circle/core/theme/styles.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/features/points/presentation/view_model/points_provider.dart';
import 'package:circle/features/points/presentation/view/widgets/point_list_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointListView extends StatelessWidget {
  final PointsProvider provider;
  const PointListView({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'registery'.tr(),
          style: TextStyles.font12MadaRegularGray,
        ),
        verticalSpace(12),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.history.length,
            itemBuilder: (context, index) {
              return provider.isLoading
                  ? const LoadingWidget()
                  : PointListTitle(
                      points: provider.history[index].points!,
                      subTitle: 'ahmed_adel'.tr(),
                    );
            }),
      ]),
    );
  }
}
