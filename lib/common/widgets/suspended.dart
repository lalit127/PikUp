// ignore_for_file: deprecated_member_use

import 'package:pikup_app/common/common_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

// class SuspendedFrame extends GetView<FindPasswordController> {
//   const SuspendedFrame({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_3),
//           child: buildEmailNotFound(),
//         ),
//       ),
//     );
//   }
//
//   Column buildEmailNotFound() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: AppSizes.mp_v_4,
//         ),
//         Align(
//           alignment: Alignment.topCenter,
//           child: Padding(
//             padding: EdgeInsets.only(top: AppSizes.mp_v_2),
//             child: Image.asset(
//               AppAssets.logo, // Replace with the path to your logo asset
//               width: 100, // Adjust the width according to your logo size
//               height: 40, // Adjust the height according to your logo size
//             ),
//           ),
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.asset(
//                   AppAssets.suspended,
//                   fit: BoxFit.contain,
//                   width: 10.h,
//                   height: 10.h,
//                 ),
//               ),
//               SizedBox(
//                 height: AppSizes.mp_v_2,
//               ),
//               Text(
//                 "Rider activity \nhas been suspended",
//                 textAlign: TextAlign.center,
//                 style: AppTextStyles(context).headlineBold,
//               ),
//               SizedBox(
//                 height: AppSizes.mp_v_2,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_8),
//                 child: Text(
//                   "Riders are suspended until 25-08-2023. \n For more information, \n please contact Bellboy Support.",
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles(context).display15W500.copyWith(
//                     color: AppColors.grayDark,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: AppSizes.mp_v_1,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     Assets.icons.customerservice,
//                     color: AppColors.grayLight,
//                   ),
//                   SizedBox(
//                     width: AppSizes.mp_w_2,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       openPhone("0430 027 934");
//                     },
//                     child: Text(
//                       "0430 027 934",
//                       style: AppTextStyles(context).display15W500.copyWith(
//                         color: AppColors.grayDefault,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   void openPhone(String phoneNumber) async {
//     final url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
