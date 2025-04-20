// import 'package:circle/core/helpers/constants.dart';
// import 'package:circle/core/helpers/spacing.dart';
// import 'package:circle/core/theme/styles.dart';
// import 'package:circle/core/widgets/custom_button.dart';
// import 'package:circle/core/widgets/svg_icon.dart';
// import 'package:circle/features/pay_and_delevary/ui/widgets/cash_option.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PaymentBottomSheet extends StatefulWidget {
//   const PaymentBottomSheet({super.key});
//   static List<String> paymentIcon = [
//     AppIcons.cashIcon,
//     AppIcons.visa,
//     AppIcons.masterCard,
//     AppIcons.applePay
//   ];
//   static const List<String> paymentTitle = [
//     'cash',
//     "visa",
//     "master_card",
//     "apple_pay"
//   ];

//   @override
//   State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
// }

// class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
//   int currentIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(36.r),
//         topRight: Radius.circular(36.r),
//       )),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'pay_method'.tr(),
//                 style: TextStyles.font18MadaSemiBoldBlack,
//               ),
//               SvgIcon(AppIcons.closeIcon),
//             ],
//           ),
//           verticalSpace(32),
//           Column(
//             children: List.generate(
//               PaymentBottomSheet.paymentTitle.length,
//               (index) => GestureDetector(
//                 onTap: () {
//                   currentIndex = index;
//                   setState(() {});
//                 },
//                 child: CashOption(
//                   isSelected: currentIndex == index,
//                   text: PaymentBottomSheet.paymentTitle[index],
//                   icon: PaymentBottomSheet.paymentIcon[index],
//                 ),
//               ),
//             ),
//           ),
//           verticalSpace(32),
//           CustomButton(title: 'confirm'.tr(), onTap: () {})
//         ],
//       ),
//     );
//   }
// }
