import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pikup_app/common/common_import.dart';

import 'button_primary_fill.dart';

class ButtonPrimaryFillIcon extends StatelessWidget {
  const ButtonPrimaryFillIcon({
    Key? key,
    required this.buttonSizeType,
    required this.text,
    required this.onTap,
    required this.isDisabled,
  }) : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width:
              buttonSizeType == ButtonSizeType.SMALL ? null : double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: AppColors.grayLight,
              backgroundColor:
                  isDisabled ? AppColors.grayLighter : AppColors.primary,
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
                        : AppSizes.mp_v_2 / 2,
                horizontal: buttonSizeType == ButtonSizeType.LARGE
                    ? AppSizes.mp_v_2 * 0.9
                    : buttonSizeType == ButtonSizeType.MEDIUM
                        ? AppSizes.mp_v_1 * 1.5
                        : AppSizes.mp_w_10 / 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: AppTextStyles(context).bodyLargeBold.copyWith(
                          color: AppColors.whiteOff,
                          fontSize: buttonSizeType == ButtonSizeType.LARGE
                              ? AppSizes.font_18
                              : buttonSizeType == ButtonSizeType.MEDIUM
                                  ? AppSizes.font_16
                                  : AppSizes.font_14,
                        ),
                  ),
                  SizedBox(width: AppSizes.mp_w_2),
                  SvgPicture.asset(
                    Assets.icons.alarmsvg,
                    fit: BoxFit.contain,
                    color: AppColors.whiteOff,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonPrimaryFillIconFix extends StatelessWidget {
  const ButtonPrimaryFillIconFix({
    Key? key,
    required this.buttonSizeType,
    required this.text,
    required this.onTap,
    required this.isDisabled,
  }) : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor:
              isDisabled ? AppColors.grayLighter : AppColors.primary,
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
                    : AppSizes.mp_v_2 / 2,
            horizontal: buttonSizeType == ButtonSizeType.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeType.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_w_10 / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyles(context).bodyLargeBold.copyWith(
                      color: AppColors.whiteOff,
                      fontSize: buttonSizeType == ButtonSizeType.LARGE
                          ? AppSizes.font_18
                          : buttonSizeType == ButtonSizeType.MEDIUM
                              ? AppSizes.font_16
                              : AppSizes.font_14,
                    ),
              ),
              SizedBox(width: AppSizes.mp_w_2),
              SvgPicture.asset(
                Assets.icons.alarmsvg,
                fit: BoxFit.contain,
                color: AppColors.whiteOff,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
