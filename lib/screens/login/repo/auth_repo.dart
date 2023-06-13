import 'package:dental_app/common/navigator.dart';
import 'package:dental_app/common/routing.dart';
import 'package:dental_app/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  Future<UserModel?> signInWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    //TODO - Uncomment before Release
    if (!credential.user!.emailVerified) {
      signOut();
      print("User Logged out");
      throw FirebaseAuthException(code: 'unverified-email');
    }

    return _userFromFirebase(user: credential.user);
  }

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
    user.data()!.putIfAbsent("lastSeen", () => {});

    UserModel userMod = UserModel(
      uid: user['uid'],
      phone: user['phone'],
      name: user['name'],
    );

    return userMod;
  }

  Future<void> verifyPhoneNumber({phoneNumber, name, context}) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
        UserModel userMod = UserModel(phone: phoneNumber, name: name);

        //create user
      },
      verificationFailed: (FirebaseAuthException e) {
        throw e;
      },
      codeSent: (String verificationId, int? resendToken) async {
        return;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // TODO: Handle timeout situation
      },
    );
  }

  // Future<UserModel?> createUserWithPhone({
  //   String? name,
  //   String? phone,
  // }) async {
  //   final credential = await _firebaseAuth.verifyPhoneNumber(
  //     phoneNumber: phone!,
  //   );

  //   // TODO : Uncomment before release
  //   credential.user!.sendEmailVerification();

  //   return UserModel(
  //     uid: credential.user!.uid,
  //   );
  // }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    store.delete(key: 'uid');
    store.delete(key: 'loggedIn');
  }
}
