import 'package:pikup_app/common/common_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_icon_button.dart';

class TopNavBackText extends StatelessWidget {
  const TopNavBackText({
    Key? key,
    required this.centerTitle,
    required this.rightText,
    this.backgroundColor,
    required this.useHomeIcon,
    this.onPress,
    required this.onBackPress,
    this.rightWidget,
    this.isRight = false,
  }) : super(key: key);

  final String centerTitle;
  final String rightText;
  final Widget? rightWidget;
  final bool? isRight;
  final bool useHomeIcon;
  final Color? backgroundColor;
  final Function()? onPress;
  final Function() onBackPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? null,
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
                  imagePath: Assets.icons.icProfile,
                  onPressed: onBackPress,
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
            child: InkWell(
              onTap: onPress,
              child: Text(
                rightText,
                style: AppTextStyles(context)
                    .display17W500
                    .copyWith(color: AppColors.primary),
              ),
            ),
          ),
          Visibility(
            visible: isRight!,
            child: Align(
              alignment: Alignment.centerRight,
              child: rightWidget,
            ),
          ),
        ],
      ),
    );
  }
}
