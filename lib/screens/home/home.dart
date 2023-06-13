import 'package:dental_app/common/routing.dart';
import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/screens/home/reportCard.dart';
import 'package:dental_app/screens/home/scanCard.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
          child: Container(
              decoration: const BoxDecoration(gradient: mainGrad),
              height: double.infinity,
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(Routes.home());
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Welcome",
                                    style: TextStyle(
                                        height: 0.9,
                                        letterSpacing: 0.3,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        foreground: Paint()
                                          ..shader = textGrad)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text("Rupesh",
                                    style: TextStyle(
                                        height: 0.9,
                                        letterSpacing: 0.3,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w600,
                                        foreground: Paint()
                                          ..shader = textGrad)),
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: backgroundGrey,
                              backgroundImage: AssetImage(
                                "assets/images/dpicon.png",
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ReportCard(),
                    SizedBox(
                      height: 20,
                    ),
                    ScanCard()
                  ]))))),
    );
  }
}
