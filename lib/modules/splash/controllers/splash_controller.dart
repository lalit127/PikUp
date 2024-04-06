import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:pikup_app/routes/app_pages.dart';
import 'package:pikup_app/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  final String splasehimage = Assets.icons.appLogo;

  @override
  void onInit() {
    final controller = Get.find<StatusBarColorController>();

    print("init called");
    controller.changeStatusBarColor(Constants.SPLASH);
    navigateToHome();
    super.onInit();
  }

  navigateToHome() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {
        Get.toNamed(Routes.PERSONAL_INFO);
      },
    );
  }

  Future<PermissionStatus> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status;
  }

  Future<PermissionStatus> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status;
  }
}
