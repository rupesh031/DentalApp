import 'package:dental_app/common/navigator.dart';
import 'package:dental_app/common/routing.dart';
import 'package:dental_app/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/common/data_store.dart';

class AuthRepo {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  late DataStore store;

  AuthRepo({required this.store});

  Future<void> sendResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<UserModel?> _userFromFirebase({required auth.User? user}) async {
    if (user == null) {
      return null;
    }
    UserModel? userMod = await getUserbyId(user.uid);

    return userMod;
  }

  // Future<UserModel?> signInWithEmailAndPassword({
  //   String? email,
  //   String? password,
  // }) async {
  //   final credential = await _firebaseAuth.signInWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );

  //   //TODO - Uncomment before Release
  //   if (!credential.user!.emailVerified) {
  //     signOut();
  //     print("User Logged out");
  //     throw FirebaseAuthException(code: 'unverified-email');
  //   }

  //   return _userFromFirebase(user: credential.user);
  // }

  Future<bool> isUserReg(String email) async {
    var user = await _firebaseFirestore
        .collection("registrations")
        .where("email", isEqualTo: email)
        .get();
    if (user.size == 1) return true;
    return false;
  }

  Future<UserModel?> getUserbyId(String uid) async {
    var user = await _firebaseFirestore.collection('users').doc(uid).get();

    UserModel userMod = UserModel(
      uid: user['uid'],
      phone: user['phone'],
      name: user['name'],
    );

    return userMod;
  }

  Future<void> verifyPhoneNumber({phoneNumber, context}) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.code);
        Fluttertoast.showToast(
            msg: e.code,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.red);
      },
      codeSent: (String verificationId, int? resendToken) async {
        print(verificationId);
        store.setString("otp", verificationId);
        Fluttertoast.showToast(
            msg: "OTP Sent",
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Color.fromARGB(255, 255, 255, 255));
        await Navigator.of(NavigationService.navigatorKey.currentContext!,
                rootNavigator: true)
            .push(Routes.otp());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        store.delete(key: "otp");
      },
    );
  }

  Future<String?> siginPhone({verificationId, otp}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      String? uid = userCredential.user?.uid;
      Fluttertoast.showToast(
          msg: "OTP Verfied",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Color.fromARGB(255, 232, 227, 227));

      return uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> chekSignIn({phone, context}) async {
    var userQuery = await _firebaseFirestore
        .collection("users")
        .where("phone", isEqualTo: phone)
        .limit(1)
        .get();
    if (userQuery.docs.isNotEmpty) {
      verifyPhoneNumber(context: context, phoneNumber: phone);
    } else {
      Fluttertoast.showToast(
          msg: "Sign Up First",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Color.fromARGB(255, 232, 227, 227));
    }
  }

  Future<void> chekSignUp({phone, context}) async {
    var userQuery = await _firebaseFirestore
        .collection("users")
        .where("phone", isEqualTo: phone)
        .limit(1)
        .get();
    if (!userQuery.docs.isNotEmpty) {
      verifyPhoneNumber(context: context, phoneNumber: phone);
    } else {
      Fluttertoast.showToast(
          msg: "Phone number already in use",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Color.fromARGB(255, 232, 227, 227));
    }
  }

  Future<UserModel?> createUserWithPhone({
    String? name,
    String? phone,
    String? uid,
  }) async {
    var userQuery = await _firebaseFirestore
        .collection("users")
        .where("phone", isEqualTo: phone)
        .limit(1)
        .get();
    if (!userQuery.docs.isNotEmpty) return getUserbyId(uid.toString());

    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    try {
      await usersCollection.doc(uid).set({
        'name': name,
        'phone': phone,
        'id': uid,
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.code,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Color.fromARGB(255, 232, 227, 227));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    store.delete(key: 'uid');
    store.delete(key: 'loggedIn');
  }
}
