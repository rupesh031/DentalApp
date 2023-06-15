import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';

import '../../common/navigator.dart';
import '../../common/routing.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(NavigationService.navigatorKey.currentContext!,
              rootNavigator: true)
          .push(Routes.reportScreen()),
      child: Center(
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: reportGrad),
              child: Column(children: [
                Container(
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Dental\nPrognosis",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Color(0xffEE7329),
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Row(
                //     children: [
                //       Spacer(),
                //       SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.3,
                //         height: 120,
                //         child: FittedBox(
                //           fit: BoxFit.contain,
                //           child: Text(
                //             "Dental\nPrognosis",
                //             textAlign: TextAlign.right,
                //             style: TextStyle(
                //                 color: Color(0xffEE7329),
                //                 fontSize: 35,
                //                 fontWeight: FontWeight.w600,
                //                 fontStyle: FontStyle.normal),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Cavity detected",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width *
                    //           0.3, // Adjust the width as needed
                    //       child: const FittedBox(
                    //         fit: BoxFit.contain,
                    //         child: Text(
                    //           'Previous Scan',
                    //           textAlign: TextAlign.left,
                    //           style: TextStyle(
                    //               fontSize: 15,
                    //               color: backgroundGrey,
                    //               fontWeight: FontWeight.w600,
                    //               fontStyle: FontStyle
                    //                   .normal), // Adjust the initial font size as needed
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width *
                    //           0.2, // Adjust the width as needed

                    //       child: const FittedBox(
                    //         fit: BoxFit.contain,
                    //         child: Text(
                    //           ' Date: 12/7/22',
                    //           textAlign: TextAlign.left,
                    //           style: TextStyle(
                    //               fontSize: 15,
                    //               color: backgroundGrey,
                    //               fontWeight: FontWeight.w600,
                    //               fontStyle: FontStyle
                    //                   .normal), // Adjust the initial font size as needed
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Treatment required",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 22,
                                color: Color(0xffFFEC44),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal)),
                        Text("Restoration / Filling",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffF8B249),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal))
                      ],
                    ),

                    Spacer()
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ]),
            ),
            Positioned(
                top: -90,
                right: MediaQuery.of(context).size.width * 0.35,
                child: ClipRect(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/images/reportimg.png', // Replace with the actual path to your image file
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
