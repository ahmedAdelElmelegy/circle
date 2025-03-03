import 'package:card_swiper/card_swiper.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PicturesSwiper extends StatelessWidget {
  const PicturesSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171.5.h,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            Assets.pic1,
            fit: BoxFit.fill,
          );
        },
        itemCount: 10,
        viewportFraction: 0.87,
        scale: 0.9,
      ),
    );
  }
}
