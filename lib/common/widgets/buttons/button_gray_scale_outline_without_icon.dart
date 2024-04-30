import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

import 'button_primary_fill.dart';

class ButtonGrayScaleOutlineWithOutIcon extends StatelessWidget {
  const ButtonGrayScaleOutlineWithOutIcon({
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
                  isDisabled ? AppColors.grayLighter : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius_8),
                side: !isDisabled
                    ? BorderSide(
                        color: AppColors.grayLight,
                        width: 1,
                      )
                    : BorderSide(
                        color: AppColors.grayLight,
                        width: 0,
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
                        : AppSizes.mp_v_4 / 3.5,
                horizontal: buttonSizeType == ButtonSizeType.LARGE
                    ? AppSizes.mp_v_2 * 0.9
                    : buttonSizeType == ButtonSizeType.MEDIUM
                        ? AppSizes.mp_v_1 * 1.5
                        : AppSizes.mp_w_8 / 3.9,
              ),
              child: Text(
                text,
                style: AppTextStyles(context).display15W500.copyWith(
                      fontSize: AppSizes.font_14,
                      color:
                          isDisabled ? AppColors.white70 : AppColors.grayDark,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
