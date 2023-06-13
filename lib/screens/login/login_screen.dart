import 'package:dental_app/common/loaderScreen.dart';
import 'package:dental_app/screens/login/view_models/login_auth_vm.dart';
import 'package:dental_app/screens/login/view_models/register_auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './register_form.dart';
import '../../../theme/color.dart';
import './login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginAuthViewModel, RegisterAuthViewModel>(
        builder: (context, logAuthVm, regAuthVm, _) {
      return logAuthVm.loading || regAuthVm.loading
          ? const Loader()
          : DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: AppBar(
                    backgroundColor: lightblue,
                    toolbarHeight: 230.0,
                    elevation: 0,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 10.0),
                      child: SizedBox(
                          height: 300,
                          width: 120,
                          child: Image.asset(
                            'assets/images/logicon.png',
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(0.0))),
                  ),
                  backgroundColor: lightblue,
                  body: Container(
                    decoration: BoxDecoration(
                        color: backgroundGrey,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    child: Column(
                      children: [
                        PreferredSize(
                          preferredSize: const Size.fromHeight(10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(50))),
                            child: const TabBar(
                              indicatorColor: textColor,
                              indicatorWeight: 4.0,
                              labelStyle: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                              unselectedLabelStyle: TextStyle(fontSize: 20.0),
                              labelColor: textColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 0.0),
                              tabs: [
                                Tab(text: 'Login'),
                                Tab(text: 'Sign-Up'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              LoginForm(),
                              RegisterForm(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
    });
  }
}
