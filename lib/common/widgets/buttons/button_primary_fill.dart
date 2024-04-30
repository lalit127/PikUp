// ignore_for_file: constant_identifier_names

import 'package:pikup_app/utils/base_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

import 'package:sizer/sizer.dart';

class ButtonPrimaryFill extends StatelessWidget {
  ButtonPrimaryFill(
      {Key? key,
      required this.buttonSizeType,
      required this.text,
      required this.onTap,
      required this.isterms,
      this.textColor = AppColors.black,
      required this.isDisabled})
      : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  final bool isDisabled;
  final bool isterms;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSizeType == ButtonSizeType.SMALL ? 80.w : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor: isDisabled
              ? AppColors.grayLighter
              : isterms
                  ? AppColors.black
                  : AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius_12),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonSizeType == ButtonSizeType.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeType.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 1.5,
          ),
          child: Text(
            text,
            style: buttonSizeType == ButtonSizeType.MEDIUM ||
                    buttonSizeType == ButtonSizeType.LARGE
                ? AppTextStyles(context).display15W500.copyWith(
                      color: textColor,
                      fontSize: AppSizes.font_14,
                      fontFamily: BaseFonts.lexend,
                      fontWeight: FontWeight.w600,
                    )
                : AppTextStyles(context).display15W500.copyWith(
                      color: textColor,
                    ),
          ),
        ),
      ),
    );
  }
}

class ButtonMobileAuthenticationPrimaryFill extends StatelessWidget {
  const ButtonMobileAuthenticationPrimaryFill(
      {Key? key,
      required this.buttonSizeType,
      required this.text,
      required this.onTap,
      required this.isterms,
      required this.isDisabled})
      : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;
  final bool isterms;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSizeType == ButtonSizeType.SMALL ? 80.w : 100.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor: isDisabled
              ? AppColors.grayLighter
              : isterms
                  ? AppColors.black
                  : AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius_8),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonSizeType == ButtonSizeType.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeType.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 1.5,
          ),
          child: Text(
            text,
            style: buttonSizeType == ButtonSizeType.MEDIUM ||
                    buttonSizeType == ButtonSizeType.LARGE
                ? AppTextStyles(context).display15W500.copyWith(
                      color: AppColors.whiteOff,
                      fontSize: AppSizes.font_10,
                    )
                : AppTextStyles(context).display15W500.copyWith(
                      color: AppColors.whiteOff,
                    ),
          ),
        ),
      ),
    );
  }
}

enum ButtonSizeType { LARGE, MEDIUM, SMALL }
