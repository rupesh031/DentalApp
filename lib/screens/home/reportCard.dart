import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
              Expanded(
                child: Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 100,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Cavity \nFound",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Color(0xffEE7329),
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.3, // Adjust the width as needed
                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Previous Scan',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15,
                                color: backgroundGrey,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle
                                    .normal), // Adjust the initial font size as needed
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.2, // Adjust the width as needed

                        child: const FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            ' Date: 12/7/22',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15,
                                color: backgroundGrey,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle
                                    .normal), // Adjust the initial font size as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(" Restoration / Filling\nrequired",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffFFEC44),
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal))
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
    );
  }
}
