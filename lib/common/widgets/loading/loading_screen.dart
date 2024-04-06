import 'package:pikup_app/common/common_import.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ), // You can customize the loading indicator here
      ),
    );
  }
}
