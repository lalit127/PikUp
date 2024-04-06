import 'package:pikup_app/common/widgets/buttons/button_primary_fill.dart';
import 'package:pikup_app/common/widgets/dialogs/dialog_center_common_widget.dart';
import 'package:pikup_app/utils/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';

class AppUpdate extends StatelessWidget {
  const AppUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogCenterCommonWidget(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            Text(
              'Update version',
              textAlign: TextAlign.center,
              style: AppTextStyles(context).headlineBold,
            ),
            SizedBox(
              height: AppSizes.mp_v_2,
            ),
            Text(
              "Navigate to the App Store for version updates.",
              textAlign: TextAlign.center,
              style: AppTextStyles(context)
                  .bodySmallRegular
                  .copyWith(color: AppColors.grayDefault),
            ),
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            ButtonPrimaryFill(
              isterms: false,
              buttonSizeType: ButtonSizeType.LARGE,
              isDisabled: false,
              text: "Move",
              onTap: () {
                KeyboardUtil.hideKeyboard(context);
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: AppSizes.mp_v_2 * 1.4,
            ),
          ],
        ),
      ),
    );
  }
}
