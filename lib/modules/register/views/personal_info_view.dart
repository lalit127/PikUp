import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/modules/register/views/personal_info_views/personal_info_view_mobile.dart';
import 'package:pikup_app/modules/register/views/personal_info_views/personal_info_view_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PersonalInfoView extends StatelessWidget {
  PersonalInfoView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => Scaffold(
        key: scaffoldKey,
        body: const PersonalInfoViewMobile(),
      ),

      tablet: (_) => Scaffold(
          body: Container(
        color: AppColors.grayDefault,
        child: PersonalInfoViewTablet(),
      )),

      desktop: (_) => Scaffold(
          key: scaffoldKey, body: const PersonalInfoViewMobile()), // #1
    );
  }
}
