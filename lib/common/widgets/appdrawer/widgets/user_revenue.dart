import 'package:pikup_app/common/common_import.dart';

class UserRevenue extends StatelessWidget {
  const UserRevenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_3),
      child: Card(
        color: AppColors.backgroundDark,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.mp_w_2, vertical: AppSizes.mp_w_1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.icProfile,
                  ),
                  SizedBox(width: 1.h),
                  Text(
                    "Today",
                    style: AppTextStyles(context).display15W500.copyWith(
                          color: AppColors.grayDark,
                        ),
                  ),
                ],
              ),
              Text(
                "\$15.2",
                style: AppTextStyles(context).display15W500.copyWith(
                      color: AppColors.grayDark,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
