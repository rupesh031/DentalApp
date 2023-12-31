import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/screens/login/view_models/login_auth_vm.dart';
import 'package:dental_app/screens/login/view_models/register_auth_vm.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAuthViewModel>(builder: (context, regVm, _) {
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
                  Spacer(),
                  SizedBox(
                    height: 120,
                  ),
                  Center(
                    child: Text(
                      "Enter OTP",
                      style: TextStyle(
                          color: Color.fromARGB(255, 198, 249, 232),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: Colors.white,
                    textStyle: TextStyle(color: Colors.white),
                    showFieldAsBox: false,

                    onSubmit: (String verificationCode) {
                      regVm.setotp(verificationCode);
                    }, // end onSubmit
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   "00:30",
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 97, 102, 106),
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w600),
                  // ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        gradient: buttonGrad,
                        borderRadius: BorderRadius.all(Radius.circular(28))),
                    child: ElevatedButton(
                      onPressed: () {
                        regVm.handleOtp(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20.0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Verify",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // const Text(
                  //   "Resend?",
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 97, 102, 106),
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w600),
                  // ),
                  SizedBox(
                    height: 40,
                  )
                ])))),
      );
    });
  }
}
