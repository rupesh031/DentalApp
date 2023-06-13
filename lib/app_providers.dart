import 'package:dental_app/screens/camera/view_model/cameravm.dart';
import 'package:dental_app/screens/home/view_models/home_view_model.dart';
import 'package:dental_app/screens/login/repo/auth_repo.dart';
import 'package:dental_app/screens/login/view_models/login_auth_vm.dart';
import 'package:dental_app/screens/login/view_models/register_auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './common/data_store.dart';
import './providers/dictionary.dart';
import './providers/user_info.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  final Language language;
  final DataStore store;
  final UserProv userProv;

  const AppProviders({
    required this.language,
    required this.store,
    Key? key,
    required this.child,
    required this.userProv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepo>(create: (_) => AuthRepo(store: store)),
        ChangeNotifierProvider(create: (_) => userProv),
        ChangeNotifierProvider(
            create: (_) => LoginAuthViewModel(
                myRepo: AuthRepo(store: store), userProvider: userProv)),
        ChangeNotifierProvider(create: (_) => HomeVm()),
        ChangeNotifierProvider(create: (_) => CameraVm()),
        ChangeNotifierProvider(
            create: (_) => RegisterAuthViewModel(
                store: store,
                myRepo: AuthRepo(store: store),
                userProvider: UserProv(dataStore: store))),
      ],
      child: child,
    );
  }
}
