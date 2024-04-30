import 'package:pikup_app/common/widgets/buttons/button_primary_fill.dart';
import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

class ButtonWhiteFill extends StatelessWidget {
  const ButtonWhiteFill(
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
              isDisabled ? AppColors.grayLighter : AppColors.whiteOff,
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
                    : AppSizes.mp_v_1 * 0.8,
            horizontal: AppSizes.mp_w_1,
          ),
          child: Text(
            text,
            style: AppTextStyles(context).display15W500.copyWith(
                  color: AppColors.grayDark,
                ),
          ),
        ),
      ),
    );
  }
}
