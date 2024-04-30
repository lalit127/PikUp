import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

import 'button_primary_fill.dart';

class ButtonGrayScaleOutlineOrder extends StatelessWidget {
  const ButtonGrayScaleOutlineOrder(
      {Key? key,
      required this.buttonSizeType,
      required this.text,
      required this.onTap,
      required this.isDisabled})
      : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSizeType == ButtonSizeType.SMALL ? null : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor:
              isDisabled ? Colors.transparent : AppColors.primaryLighter,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(AppSizes.radius_8),
          //
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius_8),
            side: !isDisabled
                ? BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  )
                : BorderSide(
                    color: AppColors.grayLight,
                    width: 1,
                  ),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonSizeType == ButtonSizeType.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeType.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 2,
          ),
          child: Text(
            text,
            style: AppTextStyles(context).display15W500.copyWith(
                  color: isDisabled ? AppColors.grayLight : AppColors.primary,
                ),
          ),
        ),
      ),
    );
  }
}

class ButtonGrayScaleOutlineOrderFilter extends StatelessWidget {
  const ButtonGrayScaleOutlineOrderFilter(
      {Key? key,
      required this.buttonSizeType,
      required this.text,
      required this.onTap,
      required this.isDisabled})
      : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSizeType == ButtonSizeType.SMALL ? null : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor:
              isDisabled ? Colors.transparent : AppColors.primaryLighter,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(AppSizes.radius_8),
          //
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius_8),
            side: !isDisabled
                ? BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  )
                : BorderSide(
                    color: AppColors.grayLight,
                    width: 1,
                  ),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonSizeType == ButtonSizeType.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeType.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 2,
          ),
          child: Text(
            text,
            style: AppTextStyles(context).display15W500.copyWith(
                  color: isDisabled ? AppColors.grayLight : AppColors.primary,
                ),
          ),
        ),
      ),
    );
  }
}

class ButtonGrayDefaultScaleOutlineOrder extends StatelessWidget {
  const ButtonGrayDefaultScaleOutlineOrder(
      {Key? key,
      required this.buttonSizeType,
      required this.text,
      required this.onTap,
      required this.isDisabled})
      : super(key: key);

  final ButtonSizeType buttonSizeType;
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSizeType == ButtonSizeType.SMALL ? null : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.grayLight,
          backgroundColor: isDisabled ? Colors.transparent : AppColors.whiteOff,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(AppSizes.radius_8),
          //
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius_8),
            side: !isDisabled
                ? BorderSide(
                    color: AppColors.grayDefault,
                    width: 1,
                  )
                : BorderSide(
                    color: AppColors.grayLight,
                    width: 1,
                  ),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonSizeType == ButtonSizeType.LARGE
                ? AppSizes.mp_v_2 * 0.9
                : buttonSizeType == ButtonSizeType.MEDIUM
                    ? AppSizes.mp_v_1 * 1.5
                    : AppSizes.mp_v_1 / 2,
          ),
          child: Text(
            text,
            style: AppTextStyles(context).display15W500.copyWith(
                  color: isDisabled ? AppColors.grayLight : AppColors.grayDark,
                ),
          ),
        ),
      ),
    );
  }
}
