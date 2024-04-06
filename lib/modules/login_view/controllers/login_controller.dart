import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/utils/constants.dart';

class LoginController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode(); // Added password focus node
  final emailFocusNode = FocusNode();
  RxString errorTxt = "".obs;
  RxString errorPasswordTxt = "".obs;
  var isEmailValidated = false.obs;
  var isNextPressed = false.obs;
  var isPasswordValid = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

//email:"john@mail.com"
//pass:"changeme"
  bool validateEmail() {
    final email = emailController.text.trim();
    // Regular expression pattern for email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (email.isNotEmpty && emailRegex.hasMatch(email)) {
      isEmailValidated.value = true;
      errorTxt.value = "";
      return true;
    } else {
      if (email.isEmpty) {
        errorTxt.value = 'Please enter your email';
      }
      if (isEmailValidated.value) {
        errorTxt.value = 'Invalid email';
      }
      isEmailValidated.value = false;
      return false;
    }
  }

  bool validatePassword() {
    final password = passwordController.text;
    if (password.length >= 8) {
      isPasswordValid(true);
      return true;
    } else {
      isPasswordValid(false);
      return false;
    }
  }

  void loginUser(String username, String password) async {
    errorTxt.value = "";
    // final data = await LoginService.loginUser(
    //     username.toString().toLowerCase(), password);
    // if (data!.data != null) {
    //   //Get.toNamed(Routes.QUIZ);
    // } else {
    //   errorTxt.value = data.message;
    //   appPrint('Error ${data.message}');
    // }
  }
}
