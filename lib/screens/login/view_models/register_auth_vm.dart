import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_app/common/data_store.dart';
import 'package:dental_app/common/routing.dart';
import 'package:dental_app/models/users.dart';
import 'package:dental_app/providers/user_info.dart';
import 'package:dental_app/screens/login/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/navigator.dart';

class RegisterAuthViewModel extends ChangeNotifier {
  final AuthRepo myRepo;
  final DataStore store;
  final UserProv userProvider;
  RegisterAuthViewModel(
      {required this.store, required this.myRepo, required this.userProvider});

  String _name = "";
  String _phone = "";
  String _otp = "";

  get name => _name;

  get phone => _phone;

  get otp => _otp;

  setName(String value) {
    _name = value;
  }

  setphone(String value) {
    _phone = value;
  }

  setotp(String value) {
    _otp = value;
  }

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _otpVisible = false;

  bool get otpVisible => _otpVisible;

  void toggleVisible() {
    _otpVisible = !_otpVisible;
    notifyListeners();
  }

  String errorText = "";

  void clearValues() {
    _otp = "";
    _phone = "";
    _name = "";
  }

  Future<void> postDetailsToFirestore(UserModel userModel) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("users")
        .doc(userModel.uid)
        .set(userModel.toJson());
  }

  Future<void> sigInpApi(BuildContext context) async {
    myRepo.chekSignIn(phone: phone, context: context);
  }

  Future<void> signUpApi(BuildContext context) async {
    Map data = {
      'phone': _phone.trim(),
      'name': _name.trim(),
    };

    try {
      await myRepo.chekSignUp(phone: data['phone'], context: context);
    } on FirebaseAuthException catch (e) {
      String errorText = '';
      switch (e.code) {
        case 'invalid-phone-number':
          errorText =
              'Invalid phone number. Please enter a valid phone number.';
          break;
        case 'quota-exceeded':
          errorText =
              'SMS quota for this project has been exceeded. Please try again later.';
          break;
        case 'code-sent':

        case 'unknown':
          errorText = 'An unknown error occurred. Please try again.';
          break;

        default:
          errorText = 'Verification failed. Please try again.';
          break;
      }
      setLoading(false);

      Fluttertoast.showToast(
          msg: errorText,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red);
    }
  }

  Future<void> handleOtp(context) async {
    try {
      String errorText = '';
      print(_otp);
      String? verf = store.getString("otp").toString();
      print(verf);
      String? uid = await myRepo.siginPhone(verificationId: verf, otp: _otp);
      print(uid);
      if (uid != null) {
        UserModel? value = await myRepo.createUserWithPhone(
            phone: phone, name: name, uid: uid);
        if (value != null) {
          userProvider.updateUserInfo(value);
        }
        await Navigator.of(NavigationService.navigatorKey.currentContext!,
                rootNavigator: true)
            .pushReplacement(Routes.home());
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-verification-code':
          errorText = 'Invalid verification code. Please try again.';
          break;
        case 'too-many-requests':
          errorText =
              'Too many OTP verification attempts. Please try again later.';
          break;
        default:
          errorText =
              'An error occurred while signing in with OTP. Please try again.';
      }
    }
    Fluttertoast.showToast(
        msg: errorText,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red);
  }

  void signOut() {
    myRepo.signOut();
  }
}
