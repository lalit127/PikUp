import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

class AppTextStyles {
  final BuildContext? context;
  late final TextStyle display12W500;
  late final TextStyle display14W500;
  late final TextStyle display15W500;
  late final TextStyle display17W500;
  late final TextStyle display16W500;

  AppTextStyles(this.context) {
    display12W500 = TextStyle(
      fontSize: AppSizes.font_12,
      fontWeight: FontWeight.w500,
    );
    display14W500 = TextStyle(
      fontSize: AppSizes.font_14,
      fontWeight: FontWeight.w500,
    );
    display15W500 = TextStyle(
      fontSize: AppSizes.font_15,
      fontWeight: FontWeight.w500,
    );
    display16W500 = TextStyle(
      fontSize: AppSizes.font_16,
      fontWeight: FontWeight.w500,
    );
    display17W500 = TextStyle(
      fontSize: AppSizes.font_17,
      fontWeight: FontWeight.w500,
    );
  }
}
