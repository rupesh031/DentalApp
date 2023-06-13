import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? phone;
  String? name;
  String? uid;

  UserModel({
    this.phone,
    this.name,
    this.uid,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    uid = json['uid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;

    data['name'] = name;

    data['uid'] = uid;
    return data;
  }
}
