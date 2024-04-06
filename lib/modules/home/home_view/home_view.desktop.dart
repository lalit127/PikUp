import 'package:pikup_app/common/common_import.dart';

class TestingDesktopView extends StatefulWidget {
  const TestingDesktopView({super.key});

  @override
  State<TestingDesktopView> createState() => _TestingMobileViewState();
}

class _TestingMobileViewState extends State<TestingDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Log in",
            textAlign: TextAlign.start,
            style: AppTextStyles(context).displayOneBold,
          ),
        ],
      ),
    );
  }
}
