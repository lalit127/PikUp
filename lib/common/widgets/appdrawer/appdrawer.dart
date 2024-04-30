import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:pikup_app/common/widgets/buttons/slider_button.dart';
import 'package:pikup_app/routes/app_pages.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'widgets/menu_item.dart';
import 'widgets/swipe_button.dart';
import 'widgets/user_info.dart';
import 'widgets/user_revenue.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final StatusBarColorController statusBarController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: AppColors.whiteOff,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: AppSizes.mp_v_1,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: AppSizes.mp_v_2,
                  ),
                  child: InkWell(
                    onTap: () {
                      statusBarController.changeStatusBarColor("");
                      Get.back();
                    },
                    child: SvgPicture.asset(Assets.icons.icProfile),
                  ),
                ),
              ),
              UesrInfo(),
              SizedBox(
                height: AppSizes.mp_v_1,
              ),
              UserRevenue(),
              SizedBox(
                height: AppSizes.mp_v_1,
              ),
              MenuItem(),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.mp_v_2,
                ),
                child: buildSliderbutton(),
              ),
              SizedBox(
                height: AppSizes.mp_v_4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSliderbutton() {
    return CustomSliderButton(
      ///Change All the color and size from here.
      width: 270,
      radius: 10,
      buttonSize: 55,
      dismissible: true,
      buttonColor: AppColors.whiteOff,
      backgroundColor: AppColors.black,
      highlightedColor: Colors.white,
      alignLabel: Alignment.center,
      icon: Assets.icons.icProfile,
      baseColor: AppColors.primary,
      onPressed: () {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            Get.toNamed(Routes.PRE_WORK_CHECKLIST);
          });
        });
      },
    );
  }
}
