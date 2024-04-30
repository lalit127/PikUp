import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/widgets/buttons/custom_button.dart';
import 'package:pikup_app/gen/assets.gen.dart';
import 'package:pikup_app/modules/login/controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  TextEditingController phoneController = TextEditingController();

  Country _selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  // late AnimationController _controller;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     duration: Duration(seconds: 2), // Adjust the duration as needed
  //     vsync: this,
  //   )..repeat(); // Repeats the animation indefinitely
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      backgroundColor: AppColors.accent,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              Assets.images.bikeMan.path,
              alignment: Alignment.center,
            ).marginOnly(left: MediaQuery.of(context).size.width * 0.2),
            SizedBox(
              height: 10,
            ),
            Text("Register", style: AppTextStyles(context).display17W500),
            Text(
              "Add Your Phone Number. We'll send you a verification code",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  phoneController.text = value;
                });
              },
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                  hintText: "Enter phone Number",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black12)),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(13),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              setState(() {
                                _selectedCountry = value;
                              });
                            });
                      },
                      child: Text(
                        "${_selectedCountry.flagEmoji} + ${_selectedCountry.phoneCode}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 9
                      ? Container(
                          margin: EdgeInsets.all(10),
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                  onPressed: () {
                    sendPhoneNumber();
                  },
                  text: 'Get OTP',
                  textColor: Colors.black,
                  buttonColor: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final controller = Get.put<AuthController>(AuthController());
    String phoneNumber = phoneController.text.trim();
    controller.signInWithPhone(
        context, "+${_selectedCountry.phoneCode}$phoneNumber");
  }
}
