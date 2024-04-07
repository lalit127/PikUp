import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pikup_app/common/widgets/show_snack_bar_widget.dart';
import 'package:pikup_app/models/user_model.dart';
import 'package:pikup_app/modules/login/views/otp_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  RxBool _isSignedIn = false.obs;
  bool get isSignedIn => _isSignedIn.value;
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  RxString _uid = ''.obs;
  String get uid => _uid.value;
  Rx<UserModel> _userModel = UserModel().obs;
  UserModel get userModel => _userModel.value;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  AuthController() {
    checkSign();
  }

  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn.value = s.getBool("is_signedin") ?? false;
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn.value = true;
  }

  // signin
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpView(verificationId: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  // verify otp
  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading.value = true;

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);

      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

      if (user != null) {
        _uid.value = user.uid;
        onSuccess();
      }
      _isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading.value = false;
    }
  }

  // DATABASE OPERATIONS
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid.value).get();
    if (snapshot.exists) {
      print("USER EXISTS");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required File profilePic,
    required Function onSuccess,
  }) async {
    _isLoading.value = true;
    try {
      await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
        userModel.profilePic = value;
        userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
        userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
        userModel.uid = _firebaseAuth.currentUser!.phoneNumber!;
      });
      _userModel.value = userModel;

      await _firebaseFirestore
          .collection("users")
          .doc(_uid.value)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading.value = false;
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading.value = false;
    }
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel.value = UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        createdAt: snapshot['createdAt'],
        bio: snapshot['bio'],
        uid: snapshot['uid'],
        profilePic: snapshot['profilePic'],
        phoneNumber: snapshot['phoneNumber'],
      );
      _uid.value = userModel.uid ?? '';
    });
  }

  // STORING DATA LOCALLY
  Future saveUserDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel.value = UserModel.fromMap(jsonDecode(data));
    _uid.value = _userModel.value.uid ?? '';
  }

  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn.value = false;
    s.clear();
  }
}
