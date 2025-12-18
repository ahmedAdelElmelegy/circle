// import 'dart:ui_web' as ui;
// import 'dart:html' as html;
// import 'package:flutter/material.dart';

// class IframeImageView extends StatefulWidget {
//   final String imageUrl;
//   final double height;

//   const IframeImageView({
//     super.key,
//     required this.imageUrl,
//     required this.height,
//   });

//   @override
//   State<IframeImageView> createState() => _IframeImageViewState();
// }

// class _IframeImageViewState extends State<IframeImageView> {
//   late final String viewType;

//   @override
//   void initState() {
//     super.initState();

//     viewType = 'iframe-${widget.imageUrl}';

//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       viewType,
//       (int viewId) {
//         final iframe = html.IFrameElement()
//           ..src = widget.imageUrl
//           ..style.border = 'none'
//           ..style.width = '100%'
//           ..style.height = '100%'
//           ..style.objectFit = 'cover';

//         return iframe;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height,
//       width: double.infinity,
//       child: HtmlElementView(
//         viewType: viewType,
//       ),
//     );
//   }
// }
