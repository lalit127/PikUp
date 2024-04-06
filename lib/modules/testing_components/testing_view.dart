import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/appbar/appbar.dart';
import 'package:pikup_app/common/widgets/appdrawer/appdrawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'testing_view/testing_view.desktop.dart';

class TestingView extends StatelessWidget {
  TestingView({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBars(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          isOrderpage: true,
          onsortIconPressed: () {},
          onMapIconPressed: () {},
        ),
        drawer: AppDrawer(),
        body: const TestingDesktopWidgetView(),
      ),
      // #1
      tablet: (_) => Scaffold(
          body: Container(
        color: AppColors.grayDefault,
      )),
      // #1
      desktop: (_) => Scaffold(
          key: scaffoldKey,
          appBar: CustomAppBars(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            isOrderpage: true,
            onsortIconPressed: () {},
            onMapIconPressed: () {},
          ),
          drawer: AppDrawer(),
          body: TestingDesktopWidgetView()), // #1
    );
  }
}
