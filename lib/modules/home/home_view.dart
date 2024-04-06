import 'package:pikup_app/common/common_import.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => Scaffold(
          body: Container(
        color: AppColors.primary,
      )), // #1
      tablet: (_) => Scaffold(
          body: Container(
        color: AppColors.grayDefault,
      )), // #1
      desktop: (_) => Scaffold(
          body: Container(
        color: AppColors.warning,
      )), // #1
    );
  }
}
