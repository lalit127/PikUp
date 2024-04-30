import 'package:pikup_app/common/common_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'navigation/app_commom_cached_image.dart';

class ItemPhotoUploadAdd extends StatelessWidget {
  const ItemPhotoUploadAdd(
      {Key? key,
      required this.isAddButton,
      required this.onDeleteTap,
      required this.onAddTap,
      required this.onViewTap})
      : super(key: key);

  final bool isAddButton;
  final VoidCallback onDeleteTap;
  final VoidCallback onAddTap;
  final VoidCallback onViewTap;

  @override
  Widget build(BuildContext context) {
    if (isAddButton) {
      return buildAddButton(context);
    } else {
      return buildUploadedImage();
    }
  }

  Widget buildAddButton(context) {
    return Container(
      width: AppSizes.icon_size_28,
      height: AppSizes.icon_size_28,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius_12),
          border: Border.all(
            color: AppColors.grayLighter.withOpacity(0.7),
            width: 3.0,
          ),
          color: AppColors.whiteOff),
      child: MaterialButton(
        onPressed: onAddTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.icProfile,
              width: AppSizes.icon_size_8,
              color: AppColors.grayDefault,
            ),
            SizedBox(
              height: AppSizes.mp_v_1 / 2,
            ),
            Text(
              "0/5",
              style: AppTextStyles(context).display15W500.copyWith(
                    color: AppColors.grayLight,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUploadedImage() {
    return Container(
      width: AppSizes.icon_size_28,
      height: AppSizes.icon_size_28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radius_12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radius_12),
        child: Stack(
          children: [
            MaterialButton(
              onPressed: onViewTap,
              padding: EdgeInsets.zero,
              minWidth: 0,
              child: const AppCommonCachedImage(
                imageUrl:
                    "https://i.pcmag.com/imagery/roundups/07ml3nh3QrzTLZ9UycfQQB2-49..v1668971764.jpg",
              ),
            ),
            IgnorePointer(
              child: Container(
                color: AppColors.whiteOff.withOpacity(0.1),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onDeleteTap,
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.mp_w_2),
                  child: CircleAvatar(
                    backgroundColor: AppColors.blackLight,
                    radius: AppSizes.icon_size_2 * 1.6,
                    child: SvgPicture.asset(
                      Assets.icons.icProfile,
                      color: AppColors.whiteOff,
                      width: AppSizes.icon_size_4 * 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
