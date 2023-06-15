// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dental_app/common/navigator.dart';
import 'package:dental_app/common/routing.dart';
import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const profStyle = TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins");
    return Container(
        decoration: BoxDecoration(gradient: mainGrad),
        child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.21,
                  vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: backgroundGrey,
                        backgroundImage: AssetImage(
                          "assets/images/dpicon.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Priyansh Kothari",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "345priyansh@gmail.com",
                      style: profStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "+91 8769644349",
                      style: profStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Male",
                      style: profStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "DOB: 21/09/2003",
                      style: profStyle,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    const Center(
                      child: Text(
                        "Edit Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Spacer(),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            gradient: buttonGrad,
                            borderRadius:
                                BorderRadius.all(Radius.circular(28))),
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(20.0)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ]),
            ))));
  }
}
