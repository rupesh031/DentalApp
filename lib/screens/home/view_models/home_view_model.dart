import 'package:flutter/material.dart';

class HomeVm extends ChangeNotifier {
  int _selectedIndex = 0;
  bool camera = false;
  int get selectedIndex => _selectedIndex;
  dynamic cameraVm;

  void onItemTapped(int index) {
    _selectedIndex = index;
    if (_selectedIndex == 1) {
      camera = true;
      if (!cameraVm.preview) cameraVm.initializeCamera();
    } else {
      camera = false;
      if (cameraVm.isCameraReady) cameraVm.disposeCamera();
    }
    notifyListeners();
  }
}
