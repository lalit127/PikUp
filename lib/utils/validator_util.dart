class ValidatorUtil {
  static bool isPhoneValidEthiopian(String text) {
    bool isPhoneValidEthiopian = true;

    if (text.length == 13) {
      if (!text.startsWith("+251")) {
        isPhoneValidEthiopian = false;
      }
    }

    if (text.length == 12) {
      if (!text.startsWith("251")) {
        isPhoneValidEthiopian = false;
      }
    }

    if (text.length == 10) {
      if (!text.startsWith("0")) {
        isPhoneValidEthiopian = false;
      }
    }

    if (text.length == 9) {
      if (!text.startsWith("9")) {
        isPhoneValidEthiopian = false;
      }
    }

    if (text.length < 9 || text.length == 11 || text.length > 13) {
      isPhoneValidEthiopian = false;
    }
    return isPhoneValidEthiopian;
  }




  static String formatPhoneNumber(String text) {
    ///VALIDATE PHONE NUMBER FIRST
    if (!isPhoneValidEthiopian(text)) {
      throw 'PhoneNumberValidationError';
    }

    String formattedPhoneNumber = "";

    if (text.length == 13) {
      formattedPhoneNumber = text;
    }

    if (text.length == 12) {
      formattedPhoneNumber = '+$text';
    }

    if (text.length == 10) {
      formattedPhoneNumber = '+251${text.substring(1)}';
    }

    if (text.length == 9) {
      formattedPhoneNumber = '+251$text';
    }

    return formattedPhoneNumber;
  }
}
