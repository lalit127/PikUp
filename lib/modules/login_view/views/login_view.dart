import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:pikup_app/common/widgets/appdrawer/appdrawer.dart';
import 'package:pikup_app/common/widgets/buttons/button_primary_fill_login.dart';
import 'package:pikup_app/common/widgets/forms/common_input_text_field.dart';
import 'package:pikup_app/common/widgets/navigation/top_nav_back_text.dart';
import 'package:pikup_app/utils/base_extensions.dart';
import 'package:pikup_app/utils/base_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = getAppLocalizations(context)!;
    final StatusBarColorController statusBarController = Get.find();
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        //resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              50.0.toVSB,
              SvgPicture.asset(Assets.icons.appLogo).toCenter,
              50.0.toVSB,
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.0.toVSB,
                  ],
                ).toHPadding(20),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildEmailInput() {
    return CommonInputTextField(
      hint: 'Email',
      autofocus: true,
      controller: controller.emailController,
      focusNode: controller.emailFocusNode,
      errorText: controller.errorTxt.value,
      onChanged: (value) {
        // Validate email on type
        bool isValid = controller.validateEmail();
        controller.isEmailValidated.value = isValid;
        // Check if email is valid and update UI accordingly
        if (isValid) {
          controller.isNextPressed(false); // Reset Next button
        }
      },
      validator: (value) {
        return null;
      },
    );
  }

  buildPasswordInput() {
    return CommonInputTextField(
      hint: 'Password',
      hintToLabel: true,
      isPassword: true,
      errorText: controller.errorPasswordTxt.value,

      onChanged: (value) {
        // Validate password on type
        bool isValid = controller.validatePassword();
        controller.isPasswordValid.value = isValid;
      },
      validator: (value) {
        if (value!.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            controller.errorPasswordTxt.value = "Please check the password.";
          });
          return null;
        }
        if (!controller.isPasswordValid.value) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            controller.errorPasswordTxt.value = "Please check the password.";
          });
          return null;
        }
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          controller.errorPasswordTxt.value = "";
        });
        return null;
      },
      controller: controller.passwordController,
      autofocus: controller.isNextPressed.value,
      // Set autofocus to true when Next is pressed
      focusNode: controller.passwordFocusNode, // Pass the password focus node
    );
  }

  bool isDark = false;
  buildFindEmailButton(context) {
    return MaterialButton(
      onPressed: () {
        controller.emailController.clear();
        controller.passwordController.clear();
        // Get.dialog(
        //   const DialogFindEmail(),
        //   barrierDismissible: true,
        // );
        isDark = !isDark;
        StatusBarColorController statusBarColorController =
            Get.put(StatusBarColorController());
        statusBarColorController.isDark(isDark);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Center(
          child: Text(
            "Find e-mail",
            style: AppTextStyles(context)
                .bodySmallUnderlineRegular
                .copyWith(color: AppColors.grayLight),
          ),
        ),
      ),
    );
  }

  buildFindPassswordButton(context) {
    return MaterialButton(
      onPressed: () {
        controller.emailController.clear();
        controller.passwordController.clear();
        //Get.toNamed(Routes.FIND_PASSWORD);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Center(
          child: Text(
            "Find password",
            style: AppTextStyles(context)
                .bodySmallUnderlineRegular
                .copyWith(color: AppColors.grayLight),
          ),
        ),
      ),
    );
  }

  buildButton(BuildContext context) {
    final isEmailValidated = controller.isEmailValidated.value;
    final isNextPressed = controller.isNextPressed.value;
    final isPasswordValid = controller.isPasswordValid.value;
    late Color buttonColors;

    bool isDisabled = (!isEmailValidated && !isPasswordValid) ||
        (isEmailValidated && !isNextPressed && !isPasswordValid);

    String buttonText;
    if (isEmailValidated) {
      if (isNextPressed) {
        if (isPasswordValid) {
          buttonText = "Log in";
          buttonColors = AppColors.primary;
        } else {
          buttonText = "Enter password";
          buttonColors = AppColors.grayLight;
        }
      } else {
        if (isPasswordValid) {
          buttonText = "Log in";
          buttonColors = AppColors.primary;
        } else {
          buttonText = "Next";
          buttonColors = AppColors.primary;
        }
      }
    } else {
      if (isPasswordValid) {
        buttonText = "Log in";
        buttonColors = AppColors.grayLight;
      } else {
        buttonText = "Enter your E-mail";
        buttonColors = AppColors.grayLight;
      }
    }

    return ButtonPrimaryFillLogin(
      buttonSizeType: ButtonSizeTypeLogin.MEDIUM,
      isDisabled: isDisabled,
      buttonColor: buttonColors,
      text: buttonText,
      onTap: () {
        if (isEmailValidated && !isNextPressed) {
          controller.isNextPressed(true);
          Future.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(context).requestFocus(controller.passwordFocusNode);
          });
        } else {
          // Call the login function
          controller.loginUser(controller.emailController.text,
              controller.passwordController.text);
        }
      },
    );
  }
}
