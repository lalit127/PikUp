import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

import 'button_primary_fill.dart';

class ButtonGrayScaleOutline extends StatelessWidget {
  const ButtonGrayScaleOutline(
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
      child: GestureDetector(
        onTap: onTap,
        child: AbsorbPointer(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor:
                  isDisabled ? AppColors.grayLighter : Colors.transparent,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(AppSizes.radius_8),
              //
              // ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius_8),
                side: BorderSide(
                  color: AppColors.grayLight,
                  width: 2,
                ),
              ),
            ),
            onPressed: () {},
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: buttonSizeType == ButtonSizeType.LARGE
                        ? AppSizes.mp_v_2 * 0.9
                        : buttonSizeType == ButtonSizeType.MEDIUM
                            ? AppSizes.mp_v_1 * 1.5
                            : AppSizes.mp_v_1 / 2,
                    horizontal: AppSizes.mp_w_2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.mp_w_2),
                      child: Text(
                        text,
                        style: AppTextStyles(context).bodyLargeBold.copyWith(
                              color: AppColors.grayDark,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
