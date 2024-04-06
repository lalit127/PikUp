import 'package:pikup_app/common/common_import.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed; // Add a parameter for onPressed function
  final bool isOrderpage; // Add a parameter for onPressed function
  final VoidCallback onMapIconPressed;
  final VoidCallback onsortIconPressed;
  final GetxController? controller;

  const CustomAppBars({
    Key? key,
    required this.onPressed,
    required this.isOrderpage,
    required this.onsortIconPressed,
    required this.onMapIconPressed,
    this.controller,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: AppBar(
          leadingWidth: 40.w,
          backgroundColor: AppColors.whiteOff,
          elevation: 0,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: SvgPicture.asset(Assets.icons.alarmsvg),
                onPressed: onPressed, // Use the onPressed parameter here
              ),
              SizedBox(
                width: 25.w,
                height: 26.w,
                child: Image.asset(
                  Assets.images.imgSentEmail.path,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          actions: [],
        ));
  }
}

class CustomAppBarswithTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarswithTitle({
    required this.onPressed,
    required this.icon,
    super.key,
    required this.text,
    this.onPressedAction,
    this.iconAction,
    this.background = Colors.white,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String text;
  final String icon;
  final VoidCallback onPressed; // Add a parameter for onPressed function
  final VoidCallback? onPressedAction; // Add a parameter for onPressed function
  final String? iconAction;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(icon: SvgPicture.asset(icon), onPressed: onPressed),
      centerTitle: true,
      title: Text(
        text,
        style: AppTextStyles(context).bodyLargeBold.copyWith(),
        textAlign: TextAlign.center,
      ),
      actions: [
        iconAction != null
            ? IconButton(
                icon: SvgPicture.asset(iconAction!), onPressed: onPressedAction)
            : SizedBox(),
      ],
    );
  }
}

class CustomAppBarWithTitleIconAction extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithTitleIconAction({
    required this.onPressed,
    super.key,
    required this.text,
    required this.icon,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String text;
  final String icon;
  final List<Widget>? actions;
  final VoidCallback onPressed; // Add a parameter for onPressed function

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteOff,
      elevation: 0,
      shadowColor: Colors.transparent,
      leading: IconButton(icon: SvgPicture.asset(icon), onPressed: onPressed),
      centerTitle: true,
      title: Text(
        text,
        style: AppTextStyles(context)
            .titleBold
            .copyWith(fontSize: AppSizes.font_18),
        textAlign: TextAlign.center,
      ),
      actions: actions,
    );
  }
}
