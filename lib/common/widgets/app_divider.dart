import 'package:pikup_app/common/common_import.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
