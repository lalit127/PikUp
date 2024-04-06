import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/food_item.dart';
import 'package:pikup_app/common/widgets/forms/common_input_text_field.dart';
import 'package:pikup_app/common/widgets/numberpicker.dart';
import 'package:pikup_app/modules/register/controllers/register_controller.dart';
import 'package:pikup_app/utils/base_extensions.dart';
import 'package:pikup_app/utils/base_fonts.dart';
import 'package:pikup_app/utils/keyboard.dart';
import 'package:toggle_switch/toggle_switch.dart';

class InterestViewMobile extends GetView<RegisterController> {
  const InterestViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        //resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Obx(
            () => SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  50.0.toVSB,
                  SvgPicture.asset(Assets.icons.appLogo).toCenter,
                  50.0.toVSB,
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        40.0.toVSB,
                        Text(
                          controller.localizations.your_interest,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: BaseFonts.lexend,
                            color: AppColors.secondaryColor,
                            fontSize: AppSizes.font_28,
                          ),
                        ),
                        25.0.toVSB,
                        buildCuisine(),
                        15.0.toVSB,
                        buildEat(),
                        20.0.toVSB,
                        ButtonPrimaryFill(
                          isterms: false,
                          buttonSizeType: ButtonSizeType.LARGE,
                          isDisabled: false,
                          text: controller.localizations.register,
                          onTap: () {},
                        ),
                        20.0.toVSB,
                      ],
                    ).toHPadding(20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCuisine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.localizations.cuisine,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: BaseFonts.lexend,
            color: AppColors.secondaryColor,
            fontSize: AppSizes.font_16,
          ),
        ),
        3.0.toVSB,
        Text(
          controller.localizations.you_can_choose_maximum_5_preference,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: BaseFonts.lexend,
            color: AppColors.uiColor,
            fontSize: AppSizes.font_10,
          ),
        ),
        15.0.toVSB,
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.foodItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              var item = controller.foodItems[index];
              return FoodItem(
                image: item.image ?? '',
                title: item.title ?? '',
              );
            }),
      ],
    );
  }

  Widget buildEat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.localizations.do_you_eat,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: BaseFonts.lexend,
            color: AppColors.secondaryColor,
            fontSize: AppSizes.font_16,
          ),
        ),
        15.0.toVSB,
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: AppColors.primaryColor,
                    groupValue: controller.isRegularDiet.value,
                    onChanged: (bool? value) {
                      controller.isRegularDiet.value = value ?? false;
                    },
                  ),
                  10.0.toHSB,
                  Text(
                    controller.localizations.veg,
                    style: TextStyle(
                        fontSize: AppSizes.font_12,
                        fontFamily: BaseFonts.lexend,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryColor),
                  )
                ],
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: AppColors.primaryColor,
                    groupValue: controller.isRegularDiet.value,
                    onChanged: (bool? value) {
                      controller.isRegularDiet.value = value ?? false;
                    },
                  ),
                  10.0.toHSB,
                  Text(
                    controller.localizations.non_veg,
                    style: TextStyle(
                        fontSize: AppSizes.font_12,
                        fontFamily: BaseFonts.lexend,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryColor),
                  )
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Vegan',
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: AppColors.primaryColor,
                    groupValue: controller.doYouEat.value,
                    onChanged: (String? value) {
                      controller.doYouEat.value = value ?? '';
                    },
                  ),
                  10.0.toHSB,
                  Text(
                    controller.localizations.vegan,
                    style: TextStyle(
                        fontSize: AppSizes.font_12,
                        fontFamily: BaseFonts.lexend,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
