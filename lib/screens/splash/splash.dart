import 'dart:async';
import 'package:dental_app/screens/splash/viewModel/splashVm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/components/gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var splashVm = Provider.of<SplashVM>(context, listen: false);
    Timer(Duration(seconds: 4), () => splashVm.isLogged(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: mainGrad),
        child: Center(
          child: CircleAvatar(
            radius: 75.0,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/loader.gif"),
          ),
        ),
      ),
    );
  }
}
