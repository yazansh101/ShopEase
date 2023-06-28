// ignore_for_file: empty_catches

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_text.dart';
import '../widgets/custom_text_bottun.dart';

class ImagePickerService extends GetxController {
  File? storedImage;
  bool? isFromCamera;

  Future<void> takePictuer(BuildContext ctx) async {
    final picker = ImagePicker();
    await showDialogForSelectCamereOrGallery(ctx);
    try {
      final imageFile = await picker.pickImage(
        source: isFromCamera! ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 800,
      );
      storedImage = File(imageFile!.path);
    } catch (e) {}

    update();
    //final fileName= await path.baseName(imageFile.path)
    // final appDir= syspaths.getappDir()
    //final imageSaved= await imageFile.copy('${appDIr}/$fileName')
  }

  Future<dynamic> showDialogForSelectCamereOrGallery(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (context) {
        isFromCamera = null;
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 300,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: CustomText(
              text: 'Take a new Picture!',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              alignment: Alignment.center,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                  text: 'camera',
                  onPressed: () {
                    //  isFromCamera=true;
                    Navigator.of(context).pop(isFromCamera = true);
                  },
                  width: 100,
                ),
                CustomTextButton(
                  text: 'gallery',
                  onPressed: () {
                    //  isFromCamera=false;
                    Navigator.of(context).pop(isFromCamera = false);
                  },
                  width: 100,
                ),
              ],
            ));
      },
    );
  }

  ImageProvider<Object> myImage() {
    if (storedImage == null) {
      return const AssetImage('assets/images/Profile Image.png');
    } else {
      return FileImage(storedImage!);
    }
  }
}
