import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraVm extends ChangeNotifier {
  bool preview = false;
  bool camera = false;
  CameraController? controller;
  late Future<void> initializeControllerFuture;
  bool isCameraReady = false;
  bool isFrontCamera = false;
  File? imageFile;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    controller = CameraController(
      isFrontCamera ? frontCamera : cameras.first,
      ResolutionPreset.medium,
    );
    initializeControllerFuture = controller!.initialize();

    await initializeControllerFuture;
    preview = false;
    isCameraReady = true;
    notifyListeners();
  }

  Future<void> takePhoto() async {
    if (!isCameraReady) return;

    try {
      await initializeControllerFuture;

      if (!controller!.value.isInitialized) {
        print('Error: Camera controller is not initialized.');
        return;
      }
      print('photo taken');
      final image = await controller!.takePicture();

      imageFile = File(image.path);
      preview = true;
      notifyListeners();
      // disposeCamera();
      // Uncomment the following line to upload the photo immediately
      // _uploadPhoto();
    } catch (e) {
      print('Error taking photo: $e');
    }
  }

  Future<void> flipCamera() async {
    if (!isCameraReady) return;

    isFrontCamera = !isFrontCamera;

    initializeCamera();
    notifyListeners();
  }

  Future<void> pickFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      preview = true;

      // Uncomment the following line to upload the photo immediately
      // _uploadPhoto();
    }
    notifyListeners();
  }

  Future<void> uploadPhoto() async {
    if (imageFile == null) return;

    try {
      // final url = Uri.parse('YOUR_API_ENDPOINT');
      // final request = http.MultipartRequest('POST', url);
      // request.files.add(await http.MultipartFile.fromPath('image', imageFile!.path));

      // final response = await request.send();
      // if (response.statusCode == 200) {
      //   // Photo uploaded successfully
      //   print('Photo uploaded');
      // } else {
      //   // Error uploading photo
      //   print('Error uploading photo');
      // }
    } catch (e) {
      print(e);
    }
  }

  Future<void> disposeCamera() async {
    if (controller != null) {
      await controller!.dispose();
      controller = null;
      isCameraReady = false;
      notifyListeners();
    }
  }

  void closePreview() {
    preview = false;
    initializeCamera();
    imageFile = null;
    notifyListeners();
  }
}
