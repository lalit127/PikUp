import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/modules/home/controller/home_controller.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 24,
              backgroundColor: AppColors.primaryColor,
            ).paddingSymmetric(vertical: 20),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lalit Sharma',
                    style: AppTextStyles(context).display15W500,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'lalitbhai7990@gmail.com',
                          style: AppTextStyles(context).display12W500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
        Divider(
          color: AppColors.primaryColor,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: controller.drawerList.length,
            itemBuilder: (context, index) {
              return buildListItem(controller.drawerList[index].title,
                  controller.drawerList[index].leadingIcon);
            }),
      ],
    ));
  }

  buildListItem(String title, String leadingIcon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      leading: SvgPicture.asset(leadingIcon),
      onTap: () {},
    ).paddingSymmetric(horizontal: 20);
  }
}
