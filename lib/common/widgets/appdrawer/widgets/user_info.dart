import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:pikup_app/routes/app_pages.dart';
import 'package:pikup_app/utils/constants.dart';

class UesrInfo extends StatelessWidget {
  UesrInfo({super.key});
  final StatusBarColorController statusBarController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 3.h,
        minRadius: 3.h,
        backgroundColor: Colors.white,
        child: Image.asset(
          Assets.images.imgSentEmail.path,
        ),
      ),
      title: Text(
        "Kristen Stewart",
        style: AppTextStyles(context).captionBold,
      ),
      subtitle: InkWell(
        onTap: () {
          statusBarController.changeStatusBarColor(Constants.PROFILE);
          Get.back();
          Get.toNamed(Routes.MY_PAGE);
        },
        child: Row(
          children: [
            Text(
              "My Page",
              style: AppTextStyles(context).captionRegular,
            ),
            SvgPicture.asset(
              Assets.icons.alarmsvg,
            ),
          ],
        ),
      ),
      onTap: null,
    );
  }
}
