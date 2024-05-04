import 'package:pikup_app/common/bindings/app_bindings.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/modules/home/bindings/home_binding.dart';
import 'package:pikup_app/modules/home/view/home_view.dart';
import 'package:pikup_app/modules/login/views/login_view.dart';
import 'package:pikup_app/modules/splash/bindings/splash_binding.dart';
import 'package:pikup_app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
  ];
}
