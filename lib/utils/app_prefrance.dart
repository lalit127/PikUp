import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static final Future<SharedPreferences> appPref =
      SharedPreferences.getInstance();

  static var accessToken = "accessToken";
  static var attemptCount = "attemptCount";

  static Future<int?> getAttemptCount() async {
    return getIntFromSF(attemptCount);
  }

  static Future<void> incrementAttemptCount() async {
    int? currentCount = await getAttemptCount();
    int newCount = currentCount != null ? currentCount + 1 : 1;
    addIntToSF(attemptCount, newCount);
  }

  static saveJsonToPrefs(String mKey, dynamic mValue) async {
    SharedPreferences mPref = await appPref;
    String jsonString = jsonEncode(mValue);
    String base64String = base64Encode(utf8.encode(jsonString));
    mPref.setString(mKey, base64String);
  }

  static getJsonFromPrefs(String mKey) async {
    SharedPreferences mPref = await appPref;
    String? base64String = mPref.getString(mKey);
    if (base64String != null) {
      String jsonString = utf8.decode(base64Decode(base64String));
      return jsonDecode(jsonString);
    }
    return null;
  }

  static addStringToSF(String mKey, String mValue) async {
    SharedPreferences mPref = await appPref;
    String base64String = base64Encode(utf8.encode(mValue));
    mPref.setString(mKey, base64String);
  }

  static addStringListToSF(String mKey, List<String> mValueList) async {
    SharedPreferences mPref = await appPref;
    List<String> base64StringList =
        mValueList.map((item) => base64Encode(utf8.encode(item))).toList();
    mPref.setStringList(mKey, base64StringList);
  }

  static Future<List<String>> getStringListValuesSF(String mKey) async {
    SharedPreferences mPref = await appPref;
    List<String> base64StringList = mPref.getStringList(mKey) ?? [];
    List<String> originalStringList = base64StringList
        .map((item) => utf8.decode(base64Decode(item)))
        .toList();
    return originalStringList;
  }

  static getStringFromSF(String mKey) async {
    SharedPreferences mPref = await appPref;
    String? base64String = mPref.getString(mKey);
    if (base64String != null) {
      return utf8.decode(base64Decode(base64String));
    }
    return null;
  }

  static addIntToSF(String mKey, int mValue) async {
    SharedPreferences mPref = await appPref;
    String base64String = base64Encode(utf8.encode(mValue.toString()));
    mPref.setString(mKey, base64String);
  }

  static getIntFromSF(String mKey) async {
    SharedPreferences mPref = await appPref;
    String? base64String = mPref.getString(mKey);
    if (base64String != null) {
      return int.tryParse(utf8.decode(base64Decode(base64String)));
    }
    return null;
  }

  static addDoubleToSF(String mKey, double mValue) async {
    SharedPreferences mPref = await appPref;
    String base64String = base64Encode(utf8.encode(mValue.toString()));
    mPref.setString(mKey, base64String);
  }

  static getDoubleFromSF(String mKey) async {
    SharedPreferences mPref = await appPref;
    String? base64String = mPref.getString(mKey);
    if (base64String != null) {
      return double.tryParse(utf8.decode(base64Decode(base64String)));
    }
    return null;
  }

  static addBoolToSF(String mKey, bool mValue) async {
    SharedPreferences mPref = await appPref;
    String base64String = base64Encode(utf8.encode(mValue.toString()));
    mPref.setString(mKey, base64String);
  }

  static getBoolFromSF(String mKey) async {
    SharedPreferences mPref = await appPref;
    String? base64String = mPref.getString(mKey);
    if (base64String != null) {
      return utf8.decode(base64Decode(base64String)) == 'true';
    }
    return null;
  }

  static removeToSF(String mKey) async {
    SharedPreferences mPref = await appPref;
    mPref.remove(mKey);
  }

  static clearSharedPreferences() async {
    SharedPreferences mPref = await appPref;
    await mPref.clear();
    // AppPreference.addBoolToSF(AppPreference.isOnBoard, true);
    //AppPreference.addBoolToSF(AppPreference.isPermission, true);
  }
}
