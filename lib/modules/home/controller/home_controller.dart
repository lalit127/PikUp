import 'package:pikup_app/common/common_import.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  final String splasehimage = Assets.icons.alarmsvg;

  @override
  void onInit() {
    super.onInit();
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
