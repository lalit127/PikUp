import 'package:pikup_app/common/common_import.dart';
import 'package:permission_handler/permission_handler.dart';

class TestingController extends GetxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode(); // Added password focus node
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  RxString errorTxt = "".obs;
  RxString errorNameTxt = "Please enter username".obs;
  RxString errorPasswordTxt = "".obs;
  var isEmailValidated = false.obs;
  var isNameValidated = false.obs;
  var isNextPressed = false.obs;
  var isPasswordValid = false.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
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

  bool validateName() {
    final name = nameController.text.trim();
    // Regular expression pattern for email validation
    if (name.isEmpty) {
      errorNameTxt.value = 'Please enter your name';
    }
    if (name.isNotEmpty) {
      isNameValidated.value = true;
      errorNameTxt.value = "";
      return true;
    }
    isNameValidated.value = false;
    return false;
  }

  bool validatePassword() {
    final password = passwordController.text;
    if (password.length >= 8) {
      isPasswordValid(true);
      errorPasswordTxt.value = '';
      return true;
    } else {
      errorPasswordTxt.value = 'Please enter valid password';
      isPasswordValid(false);
      return false;
    }
  }
}
