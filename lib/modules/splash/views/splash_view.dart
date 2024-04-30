import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/config/theme/app_colors.dart';
import 'package:pikup_app/utils/base_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SvgPicture.asset(
       Assets.icons.icProfile,
        fit: BoxFit.contain,
      ).toCenter,
    );
  }
}
