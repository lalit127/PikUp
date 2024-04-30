import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_text_styles.dart';

class TopNavBackIcon extends StatelessWidget {
  const TopNavBackIcon(
      {Key? key,
      required this.centerTitle,
      required this.useRightIcon,
      required this.useHomeIcon})
      : super(key: key);

  final String centerTitle;
  final bool useRightIcon;
  final bool useHomeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.mp_w_2,
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
                  imagePath: Assets.icons.icProfile,
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
                        imagePath: Assets.icons.icProfile,
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
              style: AppTextStyles(context).display17W500,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: useRightIcon
                ? AppSvgButton(
                    imagePath: Assets.icons.icProfile,
                    //  imagePath: Assets.icons.al,
                    onPressed: () {},
                    size: AppSizes.icon_size_8,
                    iconColor: AppColors.blackLight,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
