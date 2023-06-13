import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/screens/camera/view_model/cameravm.dart';
import 'package:dental_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CameraVm>(builder: (context, cameraVm, _) {
      return Scaffold(
        extendBody: true,
        // appBar: AppBar(
        //   backgroundColor: blurBlue,
        // ),
        body: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Positioned.fill(
                child: !cameraVm.preview
                    ? _buildCameraPreview(cameraVm: cameraVm, context: context)
                    : _buildImagePreview(cameraVm: cameraVm, context: context),
              ),
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  color: cameraVm.preview
                      ? Colors.black.withOpacity(0.5)
                      : Colors.transparent,
                  // decoration: BoxDecoration(
                  //
                  //     borderRadius:
                  //         BorderRadius.vertical(top: Radius.circular(20))),
                  // padding: EdgeInsets.only(bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      cameraVm.preview
                          ? IconButton(
                              onPressed: () => cameraVm.initializeCamera(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ))
                          : Container(),
                      IconButton(
                        onPressed: () => cameraVm.flipCamera(),
                        icon: Icon(Icons.flip_camera_ios),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () => cameraVm.takePhoto(),
                        icon: Icon(Icons.camera),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () => cameraVm.pickFromGallery(),
                        icon: Icon(Icons.photo_library),
                        color: Colors.white,
                      ),
                      Container()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildCameraPreview(
      {required CameraVm cameraVm, required BuildContext context}) {
    if (!cameraVm.isCameraReady) {
      return Center(child: CircularProgressIndicator());
    }

    if (cameraVm.controller!.value.isInitialized) {
      return CameraPreview(cameraVm.controller!);
    } else {
      return Container();
    }
  }

  Widget _buildImagePreview(
      {required CameraVm cameraVm, required BuildContext context}) {
    if (cameraVm.imageFile == null) {
      return Container();
    }

    return Image.file(cameraVm.imageFile!);
  }
}
