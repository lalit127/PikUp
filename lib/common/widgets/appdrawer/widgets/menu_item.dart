import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:pikup_app/routes/app_pages.dart';

class MenuItem extends StatelessWidget {
  MenuItem({super.key});
  final StatusBarColorController statusBarController = Get.find();
  final List<MenuItemsModel> items = [
    MenuItemsModel(title: 'Order', route: Routes.ORDER_LIST),
    MenuItemsModel(title: 'Matched', route: ""),
    MenuItemsModel(title: 'Delivering', route: ""),
    MenuItemsModel(title: 'Earnings', route: Routes.EARNINGS),
    MenuItemsModel(
        title: 'Delivery History', route: Routes.DELIVERY_ORDER_LIST),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].title,
              style: AppTextStyles(context).bodyLargeBold),
          onTap: () {
            statusBarController.changeStatusBarColor("");
            if (items[index].route.isNotEmpty) Get.toNamed(items[index].route);
          },
        );
      },
    );
  }
}

class MenuItemsModel {
  final String title;
  final String route;

  MenuItemsModel({required this.title, required this.route});
}
