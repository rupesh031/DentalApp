import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dictionary/about_dict.dart';

class Language extends ChangeNotifier {
  // late AboutScreenDict aboutScreen;

  init() async {
    var json = await loadLanguageJSON();
    // aboutScreen = AboutScreenDict.fromJson(json["about"]);

    notifyListeners();
  }

  Future<dynamic> loadLanguageJSON() async {
    final String response =
        await rootBundle.loadString("assets/screenData.json");
    final json = await jsonDecode(response);
    return json;
  }
}
