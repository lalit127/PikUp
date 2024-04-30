// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

class ButtonPrimaryFillLogin extends StatelessWidget {
  const ButtonPrimaryFillLogin({
    Key? key,
    required this.buttonSizeType,
    required this.text,
    required this.onTap,
    required this.buttonColor,
    required this.isDisabled,
  }) : super(key: key);

  final ButtonSizeTypeLogin buttonSizeType;
  final String text;
  final VoidCallback? onTap;
  final Color buttonColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          buttonSizeType == ButtonSizeTypeLogin.SMALL ? null : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor: buttonColor, // Use the determined background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius_8),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonSizeType == ButtonSizeTypeLogin.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeTypeLogin.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 2,
          ),
          child: Text(
            text,
            style: AppTextStyles(context).display15W500.copyWith(
                  color: AppColors.whiteOff,
                ),
          ),
        ),
      ),
    );
  }
}

enum ButtonSizeTypeLogin { LARGE, MEDIUM, SMALL }
