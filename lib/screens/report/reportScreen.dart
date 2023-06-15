import 'package:dental_app/common/navigator.dart';
import 'package:dental_app/common/routing.dart';
import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';

class ReportScreeen extends StatelessWidget {
  const ReportScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final samples = ["sample1.png", "sample2.png", "sample3.png"];
    return Container(
        decoration: BoxDecoration(gradient: mainGrad),
        child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () => Navigator.of(
                                NavigationService.navigatorKey.currentContext!,
                                rootNavigator: true)
                            .pop(),
                        icon: Icon(Icons.arrow_back)),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                              text: TextSpan(
                            text: 'Cavity found',
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffEE7329)),
                            children: [
                              WidgetSpan(
                                  child: Baseline(
                                baseline: -10,
                                baselineType: TextBaseline.alphabetic,
                                child: IconButton(
                                  onPressed: () => {},
                                  icon: ImageIcon(
                                    AssetImage("assets/images/help.png"),
                                    size: 16,
                                    color: Color(0xffEE7329),
                                  ),
                                ),
                              )),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Restoration / Filling required",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    for (var item in samples)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Image.asset(
                              "assets/images/${item}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "Dental Prognosis",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: backgroundGrey),
                      ),
                    ),
                  ])),
            )));
  }
}
