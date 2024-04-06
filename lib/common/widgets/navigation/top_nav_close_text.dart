import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopNavCloseText extends StatelessWidget {
  const TopNavCloseText(
      {Key? key,
      this.onPress,
      required this.centerTitle,
      required this.rightText,
      required this.useHomeIcon})
      : super(key: key);

  final String centerTitle;
  final String rightText;
  final bool useHomeIcon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.mp_w_4,
      ),
      height: AppSizes.mp_v_6,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSvgButton(
                  imagePath: Assets.icons.alarmsvg,
                  onPressed: () {
                    Get.back();
                  },
                  size: AppSizes.icon_size_8 * 0.9,
                ),
                SizedBox(
                  width: AppSizes.mp_w_1,
                ),
                useHomeIcon
                    ? AppSvgButton(
                        imagePath: Assets.icons.alarmsvg,
                        onPressed: () {},
                        size: AppSizes.icon_size_8 * 0.9,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Center(
            child: Text(
              centerTitle,
              style: AppTextStyles(context).titleBold,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              rightText,
              style: AppTextStyles(context)
                  .titleBold
                  .copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
