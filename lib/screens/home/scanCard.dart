import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/screens/home/view_models/home_view_model.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanCard extends StatelessWidget {
  const ScanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVm>(builder: (context, homeVm, _) {
      return GestureDetector(
        onTap: () => {homeVm.onItemTapped(1)},
        child: Center(
          child: Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: reportGrad),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  "scan my\nteeth",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: backgroundGrey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30,
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
                          Icon(
                            Icons.info,
                            color: Color.fromARGB(167, 255, 255, 255),
                            size: 35,
                          )
                        ],
                      ),
                      // Image.asset(
                      //   'assets/images/info.png',
                      // ),
                    ]),
              ),
              Positioned(
                  top: 50,
                  right: -MediaQuery.of(context).size.width * 0.06,
                  child: ClipRect(
                    clipBehavior: Clip.none,
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/images/scanimg.png', // Replace with the actual path to your image file
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
