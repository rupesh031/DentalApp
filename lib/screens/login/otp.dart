import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:otp_text_field/style.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: mainGrad),
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Center(
              child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                Center(
                  child: Text(
                    "Enter OTP",
                    style: TextStyle(
                        color: Color.fromARGB(255, 198, 249, 232),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: Colors.white,
                  textStyle: TextStyle(color: Colors.white),
                  showFieldAsBox: false,

                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Resend?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 97, 102, 106),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ])))),
    );
  }
}
