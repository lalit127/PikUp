// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

class ButtonPrimaryFillSignup extends StatelessWidget {
  const ButtonPrimaryFillSignup({
    Key? key,
    required this.buttonSizeType,
    required this.text,
    required this.onTap,
    required this.isDisabled,
  }) : super(key: key);

  final ButtonSizeTypeSignup buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    Color buttonColor;

    switch (text) {
      case 'Enter your e-mail address':
        buttonColor = AppColors.grayLight;
        break;
      case 'Next':
        buttonColor = AppColors.black;
        break;
      case 'Enter password':
        buttonColor = AppColors.grayLight;
        break;
      case 'Log in':
        buttonColor = AppColors.primary;
        break;
      default:
        buttonColor = AppColors.black; // Default background color
    }

    return SizedBox(
      width:
          buttonSizeType == ButtonSizeTypeSignup.SMALL ? null : double.infinity,
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
            vertical: buttonSizeType == ButtonSizeTypeSignup.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeTypeSignup.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 2,
          ),
          child: Text(
            text,
            style: AppTextStyles(context).bodyLargeBold.copyWith(
                  color: AppColors.whiteOff,
                ),
          ),
        ),
      ),
    );
  }
}

enum ButtonSizeTypeSignup { LARGE, MEDIUM, SMALL }
