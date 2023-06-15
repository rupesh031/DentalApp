import 'package:dental_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import './app_providers.dart';
import './common/data_store.dart';
import './providers/dictionary.dart';
import './providers/user_info.dart';
import './common/navigator.dart';

final Language _language = Language();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _language.init();
  await Firebase.initializeApp();

  DataStore store = DefaultStore(await SharedPreferences.getInstance());
  UserProv userProv = UserProv(dataStore: store);

  runApp(MyApp(
    store: store,
    userProv: userProv,
  ));
}

class MyApp extends StatelessWidget {
  final DataStore store;
  final UserProv userProv;

  const MyApp({
    super.key,
    required this.store,
    required this.userProv,
  });

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      language: _language,
      userProv: userProv,
      store: store,
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Dental App',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
//
