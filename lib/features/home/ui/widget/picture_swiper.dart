import 'package:card_swiper/card_swiper.dart';
import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:circletraning/core/widgets/loading_widget.dart';
import 'package:circletraning/data/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PicturesSwiper extends StatelessWidget {
  const PicturesSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderProvider>(builder: (context, provider, child) {
      if (provider.isFailure) {
        return CustomErrorWidget(
            errMessage: provider.serverFailure!.errMessage);
      }
      return SizedBox(
        height: 171.5.h,
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return provider.isLoading
                ? const LoadingWidget()
                : CachedImage(image: provider.sliderList[index].image!);
          },
          itemCount: provider.sliderList.length,
          viewportFraction: 0.87,
          scale: 0.9,
        ),
      );
    });
  }
}
