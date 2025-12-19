import 'package:card_swiper/card_swiper.dart';
import 'package:circle/core/widgets/cached_network_image.dart';
import 'package:circle/core/widgets/loading_widget.dart';
import 'package:circle/features/home/presentation/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PicturesSwiper extends StatelessWidget {
  const PicturesSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();

    return SizedBox(
      height: 171.5.h,
      child:provider.isLoading? const LoadingWidget(): Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return   ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedImage(image: provider.sliderList[index].image!));
        },
        itemCount: provider.sliderList.length,
        viewportFraction: 0.87,
        scale: 0.9,
      ),
    );
  }
}
