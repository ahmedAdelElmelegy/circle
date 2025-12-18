// import 'package:circle/core/widgets/ip_frame.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:circle/core/widgets/cached_network_image.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// /// This widget works on Web & Mobile
// class AdaptiveImage extends StatelessWidget {
//   final String imageUrl;

//   const AdaptiveImage({
//     super.key,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (kIsWeb) {
//       return IframeImageView(
//         height: 171.5.h,
//         imageUrl: imageUrl,
//       );
//     } else {
//       return CachedImage(image: imageUrl);
//     }
//   }
// }
