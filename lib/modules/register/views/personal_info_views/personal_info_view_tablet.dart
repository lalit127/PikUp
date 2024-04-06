import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/forms/common_input_text_field.dart';
import 'package:pikup_app/common/widgets/numberpicker.dart';
import 'package:pikup_app/modules/register/controllers/register_controller.dart';
import 'package:pikup_app/utils/base_extensions.dart';
import 'package:pikup_app/utils/base_fonts.dart';
import 'package:pikup_app/utils/keyboard.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PersonalInfoViewTablet extends GetView<RegisterController> {
  PersonalInfoViewTablet({Key? key}) : super(key: key);

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
                          controller.localizations.personal_info,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: BaseFonts.lexend,
                            color: AppColors.secondaryColor,
                            fontSize: AppSizes.font_28,
                          ),
                        ),
                        25.0.toVSB,
                        buildWeightInput(),
                        25.0.toVSB,
                        buildHeightInput(),
                        21.0.toVSB,
                        buildAge(),
                        30.0.toVSB,
                        buildRegularDiet(),
                        44.0.toVSB,
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

  buildWeightInput() {
    return CommonInputTextField(
      hint: controller.localizations.weight,
      autofocus: true,
      inputType: TextInputType.number,
      controller: controller.weightController,
      focusNode: controller.weightFocusNode,
      errorText: controller.weightErrorText.value,
      onChanged: (value) {},
      suffix: Container(
        margin: const EdgeInsets.all(5),
        child: ToggleSwitch(
          minWidth: 55.0,
          fontSize: AppSizes.font_12,
          initialLabelIndex: controller.weightType.value,
          borderColor: const [AppColors.uiColor],
          borderWidth: 5,
          cornerRadius: 5,
          radiusStyle: true,
          activeBgColor: const [AppColors.appWhiteColor],
          activeFgColor: AppColors.secondaryColor,
          inactiveBgColor: AppColors.uiColor,
          inactiveFgColor: AppColors.appWhiteColor,
          totalSwitches: 2,
          labels: [controller.localizations.lbs, controller.localizations.kg],
          onToggle: (index) {
            controller.weightType.value = index ?? 0;
          },
        ),
      ),
    );
  }

  buildHeightInput() {
    return CommonInputTextField(
      hint: controller.localizations.height,
      autofocus: true,
      inputType: TextInputType.number,
      controller: controller.heightController,
      focusNode: controller.heightFocusNode,
      errorText: controller.heightErrorText.value,
      onChanged: (value) {},
      suffix: Container(
        margin: const EdgeInsets.all(5),
        child: ToggleSwitch(
          minWidth: 55.0,
          fontSize: AppSizes.font_12,
          initialLabelIndex: controller.heightType.value,
          borderColor: const [AppColors.uiColor],
          borderWidth: 5,
          cornerRadius: 7,
          radiusStyle: true,
          activeBgColor: const [AppColors.appWhiteColor],
          activeFgColor: AppColors.secondaryColor,
          inactiveBgColor: AppColors.uiColor,
          inactiveFgColor: AppColors.appWhiteColor,
          totalSwitches: 2,
          dividerMargin: 0,
          labels: [controller.localizations.feet, controller.localizations.cm],
          onToggle: (index) {
            controller.heightType.value = index ?? 0;
          },
        ),
      ),
    );
  }

  buildAge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.localizations.age,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: BaseFonts.lexend,
            color: AppColors.secondaryColor,
            fontSize: AppSizes.font_14,
          ),
        ),
        15.0.toVSB,
        Obx(
          () => NumberPicker(
            value: controller.age.value,
            minValue: 0,
            itemWidth: 40,
            selectedTextStyle: TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.font_18),
            itemCount: 7,
            maxValue: 100,
            axis: Axis.horizontal,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: AppSizes.font_14,
              fontWeight: FontWeight.w400,
              fontFamily: BaseFonts.lexend,
            ),
            onChanged: (value) => controller.age.value = value,
          ),
        ).toCenter,
      ],
    );
  }

  buildRegularDiet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.localizations.regulating_diet,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: BaseFonts.lexend,
            color: AppColors.secondaryColor,
            fontSize: AppSizes.font_14,
          ),
        ),
        11.0.toVSB,
        Obx(
          () => Row(
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
                    controller.localizations.yes,
                    style: TextStyle(
                        fontSize: AppSizes.font_12,
                        fontFamily: BaseFonts.lexend,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryColor),
                  )
                ],
              ),
              40.0.toHSB,
              Row(
                children: [
                  Radio<bool>(
                    value: false,
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
                    controller.localizations.no,
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
