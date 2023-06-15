import 'package:decorated_icon/decorated_icon.dart';
import 'package:dental_app/common/routing.dart';
import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/screens/camera/camera.dart';
import 'package:dental_app/screens/camera/view_model/cameravm.dart';
import 'package:dental_app/screens/home/home.dart';
import 'package:dental_app/screens/home/reportCard.dart';
import 'package:dental_app/screens/home/scanCard.dart';
import 'package:dental_app/screens/home/view_models/home_view_model.dart';
import 'package:dental_app/screens/login/otp.dart';
import 'package:dental_app/screens/proflie/profile.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    CameraScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeVm, CameraVm>(builder: (context, homeVm, cameraVm, _) {
      homeVm.cameraVm = cameraVm;

      return Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: homeVm.selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: homeVm.camera
              ? BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))
              : BorderRadius.all(Radius.zero),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor:
                homeVm.camera ? Color(0xff002E5B) : Colors.transparent,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: DecoratedIcon(
                  Icons.home,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: greyText,
                    ),
                  ],
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/scanicon.png"),
                  color: Colors.black,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20.0,
                        color: greyText,
                      ),
                    ],
                  ),
                  child: ImageIcon(
                    AssetImage("assets/images/scanicon.png"),
                    color: Colors.black,
                  ),
                ),
                label: 'scanner',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                activeIcon: DecoratedIcon(
                  Icons.account_circle,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: greyText,
                    ),
                  ],
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: homeVm.selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedIconTheme: const IconThemeData(size: 30.0),
            selectedIconTheme: const IconThemeData(size: 35.0),
            onTap: homeVm.onItemTapped,
          ),
        ),
      );
    });
  }
}
