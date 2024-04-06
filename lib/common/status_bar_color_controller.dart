import 'dart:io';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/config/theme/app_colors.dart';
import 'package:pikup_app/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusBarColorController extends GetxController {
  Rx<Color> statusBarColor = AppColors.backgroundLight.obs;

  void changeStatusBarColor(String pageTitle) {
    if (Platform.isAndroid) {
      if (pageTitle == Constants.PROFILE) {
        print("iniside if");

        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: AppColors.backgroundLight,
          statusBarIconBrightness: Brightness.dark,
        ));
      } else if (pageTitle == Constants.SPLASH) {
        print("iniside red");
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: AppColors.secondaryColor,
          statusBarIconBrightness: Brightness.light,
        ));
      } else {
        print("iniside else");

        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: AppColors.whiteOff,
          statusBarIconBrightness: Brightness.dark,
        ));
      }
    }
    update();
  }

  onBackPress(String pageTitle) {
    return () {
      changeStatusBarColor(pageTitle);
      Get.back();
    };
  }

  ThemeMode themeMode = ThemeMode.dark;
  bool isThemeDark = false;
  isDark(bool isDark) async {
    try {
      isThemeDark = isDark;
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      SharedPreferences.getInstance().then((pref) {
        pref.setBool('darkMode', isDark);
      });
    } catch (onError) {
      //Constants.getErrorResponse(onError);
    }
  }
}
