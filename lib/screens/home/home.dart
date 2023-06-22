import 'package:dental_app/common/routing.dart';
import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/providers/user_info.dart';
import 'package:dental_app/screens/home/reportCard.dart';
import 'package:dental_app/screens/home/scanCard.dart';
import 'package:dental_app/screens/home/view_models/home_view_model.dart';
import 'package:dental_app/theme/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeVm, UserProv>(builder: (context, homeVm, userProv, _) {
      return Scaffold(
        extendBody: true,
        body: Center(
            child: Container(
                decoration: const BoxDecoration(gradient: mainGrad),
                height: double.infinity,
                child: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("welcome",
                                    style: TextStyle(
                                        height: 0.9,
                                        letterSpacing: 0.3,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        foreground: Paint()
                                          ..shader = textGrad)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                    userProv.isLoggedIn
                                        ? userProv.currUser.name.toString()
                                        : "User",
                                    style: TextStyle(
                                        height: 0.9,
                                        letterSpacing: 0.3,
                                        fontSize: 33.0,
                                        fontWeight: FontWeight.w600,
                                        foreground: Paint()
                                          ..shader = textGrad)),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => homeVm.onItemTapped(2),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: backgroundGrey,
                                backgroundImage: AssetImage(
                                  "assets/images/dpicon.png",
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                      userProv.isLoggedIn
                          ? SizedBox(
                              height: 100,
                            )
                          : Container(),
                      userProv.isLoggedIn ? ReportCard() : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      userProv.isLoggedIn
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  gradient: reportGrad),
                              child: Text(
                                "Dental History",
                                style: TextStyle(
                                    color: backgroundGrey,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800),
                              ))
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      ScanCard()
                    ]))))),
      );
    });
  }
}
