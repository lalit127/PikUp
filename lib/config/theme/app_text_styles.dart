import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

class AppTextStyles {
  final BuildContext? context;

  late final TextStyle menuRegular;
  late final TextStyle menuBold;
  late final TextStyle captionRegular;
  late final TextStyle captionBold;
  late final TextStyle bodySmallUnderlineRegular;
  late final TextStyle bodySmallRegular;
  late final TextStyle bodySmallBold;
  late final TextStyle bodyLargeUnderlineRegular;
  late final TextStyle bodyLargeRegular;
  late final TextStyle bodyLargeBold;
  late final TextStyle titleRegular;
  late final TextStyle titleBold;
  late final TextStyle headlineRegular;
  late final TextStyle headlineBold;
  late final TextStyle displayOneRegular;
  late final TextStyle displayOneBold;
  late final TextStyle displayTwoRegular;
  late final TextStyle displayTwoBold;
  late final TextStyle displayThreeRegular;
  late final TextStyle displayThreeBold;
  late final TextStyle displayForthRegular;
  late final TextStyle textFieldLabel;

  // ///MENU
  // static final menuRegular = TextStyle(
  //   fontSize: AppSizes.font_10,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final menuBold = TextStyle(
  //   fontSize: AppSizes.font_10,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // ///CAPTION
  // static final captionRegular = TextStyle(
  //   fontSize: AppSizes.font_12,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final captionBold = TextStyle(
  //   fontSize: AppSizes.font_12,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // ///BODY
  // static final bodySmallUnderlineRegular = TextStyle(
  //     fontSize: AppSizes.font_14,
  //     fontWeight: FontWeight.w700,
  //     color: AppColors.grayDark,
  //     fontFamily: 'Jost',
  //     letterSpacing: 0.6,
  //     decoration: TextDecoration.underline);
  //
  // static final bodySmallRegular = TextStyle(
  //   fontSize: AppSizes.font_14,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final bodySmallBold = TextStyle(
  //   fontSize: AppSizes.font_14,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final bodyLargeUnderlineRegular = TextStyle(
  //   fontSize: AppSizes.font_16,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  //   decoration: TextDecoration.underline,
  // );
  //
  // static final bodyLargeRegular = TextStyle(
  //   fontSize: AppSizes.font_16,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final bodyLargeBold = TextStyle(
  //   fontSize: AppSizes.font_16,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // ///TITLE
  // static final titleRegular = TextStyle(
  //   fontSize: AppSizes.font_18,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final titleBold = TextStyle(
  //   fontSize: AppSizes.font_18,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // //HEADLINE
  // static final headlineRegular = TextStyle(
  //   fontSize: AppSizes.font_20,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final headlineBold = TextStyle(
  //   fontSize: AppSizes.font_20,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // //DISPLAY
  // static final displayOneRegular = TextStyle(
  //   fontSize: AppSizes.font_24,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final displayOneBold = TextStyle(
  //   fontSize: AppSizes.font_24,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final displayTwoRegular = TextStyle(
  //   fontSize: AppSizes.font_28,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final displayTwoBold = TextStyle(
  //   fontSize: AppSizes.font_28,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final displayThreeRegular = TextStyle(
  //   fontSize: AppSizes.font_32,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.grayDark,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );
  //
  // static final displayThreeBold = TextStyle(
  //   fontSize: AppSizes.font_32,
  //   fontWeight: FontWeight.w700,
  //   color: AppColors.black,
  //   fontFamily: 'Jost',
  //   letterSpacing: 0.6,
  // );

  AppTextStyles(this.context) {
    StatusBarColorController statusBarColorController =
        Get.put(StatusBarColorController());

    ///MENU
    menuRegular = Theme.of(context!).textTheme.bodySmall!;
    menuBold = Theme.of(context!).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
        );

    ///CAPTION
    captionRegular = Theme.of(context!).textTheme.bodyMedium!;
    captionBold = Theme.of(context!).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
        );

    ///BODY
    bodySmallRegular = Theme.of(context!).textTheme.bodyLarge!;
    bodySmallBold = Theme.of(context!).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
        );

    bodySmallUnderlineRegular = Theme.of(context!)
        .textTheme
        .bodyLarge!
        .copyWith(
            fontWeight: FontWeight.w700,
            color: statusBarColorController.isThemeDark
                ? AppColors.grayLighter
                : AppColors.grayDark,
            decoration: TextDecoration.underline);

    bodyLargeUnderlineRegular = Theme.of(context!)
        .textTheme
        .bodyLarge!
        .copyWith(
            fontSize: AppSizes.font_16,
            fontWeight: FontWeight.w700,
            color: statusBarColorController.isThemeDark
                ? AppColors.grayLighter
                : AppColors.grayDark,
            decoration: TextDecoration.underline);

    bodyLargeRegular = Theme.of(context!).textTheme.bodyLarge!.copyWith(
          fontSize: AppSizes.font_16,
          fontWeight: FontWeight.w400,
        );

    bodyLargeBold = Theme.of(context!).textTheme.bodyLarge!.copyWith(
          fontSize: AppSizes.font_16,
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
        );

    ///TITLE
    titleRegular = Theme.of(context!).textTheme.titleMedium!;
    titleBold = Theme.of(context!).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
        );

    ///HEADLINE
    headlineRegular = Theme.of(context!).textTheme.headlineMedium!;
    headlineBold = Theme.of(context!).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
        );

    ///DISPLAY
    displayOneRegular = Theme.of(context!).textTheme.displaySmall!;
    displayOneBold = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
        );

    displayTwoRegular = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontSize: AppSizes.font_28,
        );
    displayTwoBold = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
          fontSize: AppSizes.font_28,
        );

    displayThreeRegular = Theme.of(context!).textTheme.displayMedium!.copyWith(
          fontSize: AppSizes.font_32,
        );
    displayThreeBold = Theme.of(context!).textTheme.displayMedium!.copyWith(
          fontWeight: FontWeight.w700,
          color: statusBarColorController.isThemeDark
              ? AppColors.grayLighter
              : AppColors.black,
          fontSize: AppSizes.font_32,
        );

    displayForthRegular = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontSize: AppSizes.font_46,
          fontWeight: FontWeight.w400,
        );
    textFieldLabel = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontSize: AppSizes.font_14,
          fontWeight: FontWeight.w400,
        );
  }
}
