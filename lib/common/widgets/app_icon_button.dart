import 'package:pikup_app/common/common_import.dart';

class AppSvgButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final double size;
  final Color? iconColor;

  const AppSvgButton(
      {super.key,
      required this.imagePath,
      required this.onPressed,
      required this.size,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(AppSizes.mp_w_2),
      minWidth: size,
      height: size,
      child: SvgPicture.asset(
        imagePath,
        width: size,
        height: size,
        color: iconColor,
      ),
    );
  }
}
