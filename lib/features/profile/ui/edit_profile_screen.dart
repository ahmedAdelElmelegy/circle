// import 'package:circle/core/helpers/app_method.dart';
// import 'package:circle/core/helpers/constants.dart';
// import 'package:circle/core/theme/color_manager.dart';
// import 'package:circle/core/widgets/custom_button.dart';
// import 'package:circle/core/widgets/svg_icon.dart';
// import 'package:circle/features/profile/ui/widgets/user_name_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class EditProfileScreen extends StatelessWidget {
//   static const routeName = '/edit-profile';
//   const EditProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar('modify_my_account', context),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               children: [
//                 Stack(
//                   // clipBehavior: Clip.none,
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 12.h),
//                       width: 124.w,
//                       height: 124.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: ColorManger.red),
//                         borderRadius: BorderRadius.circular(16.r),
//                         color: ColorManger.grayLight,
//                         image: DecorationImage(
//                           image: AssetImage(Assets.profile),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       right: 3.5.w,
//                       bottom: 19.h,
//                       child: GestureDetector(
//                         onTap: () {
//                           // Navigator.pushNamed(context, EditProfileScreen.routeName);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(5.sp),
//                           decoration: const BoxDecoration(
//                               shape: BoxShape.circle, color: ColorManger.red),
//                           child: SvgIcon(AppIcons.addPhoto,
//                               width: 24.w, height: 24.h),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     UserNameField(
//                       title: 'first_name',
//                     ),
//                     UserNameField(title: 'last_name'),
//                   ],
//                 ),
//               ],
//             ),
//             CustomButton(title: 'confirm', onTap: () {}),
//           ],
//         ),
//       ),
//     );
//   }
// }
