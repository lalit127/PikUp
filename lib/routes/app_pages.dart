import 'package:pikup_app/common/bindings/app_bindings.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/modules/home/bindings/home_binding.dart';
import 'package:pikup_app/modules/home/home_view.dart';
import 'package:pikup_app/modules/login_view/bindings/login_binding.dart';
import 'package:pikup_app/modules/login_view/views/login_view.dart';
import 'package:pikup_app/modules/register/views/personal_info_view.dart';
import 'package:pikup_app/modules/splash/bindings/splash_binding.dart';
import 'package:pikup_app/modules/splash/views/splash_view.dart';
import 'package:pikup_app/modules/testing_components/bindings/testing_binding.dart';
import 'package:pikup_app/modules/testing_components/testing_view.dart';

import '../modules/register/views/interest_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFO,
      page: () => PersonalInfoView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.INTEREST,
      page: () => InterestView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TESTING,
      page: () => TestingView(),
      binding: TestingBinding(),
    ),
  ];
}
