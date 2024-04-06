import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/buttons/button_gray_scale_outline.dart';
import 'package:pikup_app/common/widgets/buttons/button_primary_fill_login.dart';
import 'package:pikup_app/common/widgets/dialogs/common_dialog.dart';
import 'package:pikup_app/common/widgets/forms/common_input_text_field.dart';
import 'package:pikup_app/modules/testing_components/controller/testing_controller.dart';
import 'package:pikup_app/utils/base_extensions.dart';

class TestingDesktopWidgetView extends GetView<TestingController> {
  const TestingDesktopWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = getAppLocalizations(context)!;
    RxBool positive = false.obs;

    return SingleChildScrollView(
      child: Center(
        child: Obx(() {
          return Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        children: [
                          Text(
                            "Button Widget",
                            textAlign: TextAlign.start,
                            style: AppTextStyles(context)
                                .bodySmallUnderlineRegular
                                .copyWith(color: AppColors.primary),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                ButtonPrimaryFillLogin(
                                  buttonSizeType: ButtonSizeTypeLogin.MEDIUM,
                                  isDisabled: false,
                                  buttonColor: AppColors.primary,
                                  text: "Login",
                                  onTap: () async {
                                    Get.dialog(
                                      CommonDialog(
                                        title: 'Update version',
                                        subTitle:
                                            'Navigate to the App Store for version updates.',
                                        buttonTitlePrimary: 'Move',
                                        buttonTitleSecondry: "Cancel",
                                        isSecondryVisible: true,
                                        onPress: () {
                                          Navigator.of(Get.overlayContext!,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                      ),
                                      barrierDismissible: false,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonGrayScaleOutline(
                                  buttonSizeType: ButtonSizeType.SMALL,
                                  isDisabled: false,
                                  text: "Login",
                                  onTap: () async {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonPrimaryFill(
                                  isterms: false,
                                  buttonSizeType: ButtonSizeType.LARGE,
                                  isDisabled: false,
                                  text: "NEXT",
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        children: [
                          Text(
                            "TextField Widget",
                            textAlign: TextAlign.start,
                            style: AppTextStyles(context)
                                .bodySmallUnderlineRegular
                                .copyWith(color: AppColors.primary),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 400,
                                  child: CommonInputTextField(
                                    hint: 'Username',
                                    hintToLabel: true,
                                    autofocus: false,
                                    controller: controller.nameController,
                                    focusNode: controller.nameFocusNode,
                                    errorText: controller.errorNameTxt.value,
                                    onChanged: (value) {
                                      controller.validateName();
                                    },
                                    validator: (value) {
                                      return null;
                                    },
                                    prefixIcon: Assets.icons.icProfile,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 400,
                                  child: CommonInputTextField(
                                    hint: 'Email',
                                    autofocus: false,
                                    controller: controller.emailController,
                                    focusNode: controller.emailFocusNode,
                                    errorText: controller.errorTxt.value,
                                    onChanged: (value) {
                                      controller.validateEmail();
                                    },
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 400,
                                  child: CommonInputTextField(
                                    hint: 'Password',
                                    autofocus: false,
                                    isPassword: true,
                                    controller: controller.passwordController,
                                    focusNode: controller.passwordFocusNode,
                                    errorText:
                                        controller.errorPasswordTxt.value,
                                    prefixIcon: Assets.icons.icLock,
                                    suffix:
                                        SvgPicture.asset(Assets.icons.icHidden)
                                            .paddingAll(10),
                                    onChanged: (value) {
                                      controller.validatePassword();
                                    },
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Text Widget Style",
                      textAlign: TextAlign.start,
                      style: AppTextStyles(context)
                          .bodySmallUnderlineRegular
                          .copyWith(color: AppColors.primary),
                    ),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        Text(
                          "menuRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).menuRegular,
                        ),
                        Text(
                          "menuBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).menuBold,
                        ),
                        Text(
                          "captionRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).captionRegular,
                        ),
                        Text(
                          "captionBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).captionBold,
                        ),
                        Text(
                          "bodySmallRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).bodySmallRegular,
                        ),
                        Text(
                          "bodySmallBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).bodySmallBold,
                        ),
                        Text(
                          "bodySmallUnderlineRegular",
                          textAlign: TextAlign.start,
                          style:
                              AppTextStyles(context).bodySmallUnderlineRegular,
                        ),
                        Text(
                          "bodyLargeRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).bodyLargeRegular,
                        ),
                        Text(
                          "bodyLargeBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).bodyLargeBold,
                        ),
                        Text(
                          "bodyLargeUnderlineRegular",
                          textAlign: TextAlign.start,
                          style:
                              AppTextStyles(context).bodyLargeUnderlineRegular,
                        ),
                        Text(
                          "titleRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).titleRegular,
                        ),
                        Text(
                          "titleBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).titleBold,
                        ),
                        Text(
                          "headlineRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).headlineRegular,
                        ),
                        Text(
                          "headlineBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).headlineBold,
                        ),
                        Text(
                          "displayOneRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).displayOneRegular,
                        ),
                        Text(
                          "displayOneBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).displayOneBold,
                        ),
                        Text(
                          "displayTwoRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).displayTwoRegular,
                        ),
                        Text(
                          "displayTwoBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).displayTwoBold,
                        ),
                        Text(
                          "displayThreeRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).displayThreeRegular,
                        ),
                        Text(
                          "displayThreeBold",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).displayThreeBold,
                        ),
                        Text(
                          "displayForthRegular",
                          textAlign: TextAlign.start,
                          style: AppTextStyles(context).displayForthRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
