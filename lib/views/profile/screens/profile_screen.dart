// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/image_picker_service.dart';
import '../../../core/utils/size_config.dart';
import '../widgets/menu_items.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  void getDi() {
    Get.put(ImagePickerService());
  }

  final imageController = Get.find<ImagePickerService>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30, ),
          _buildProfilePicture(context),
          const SizedBox(height: 30, ),
          const MenuItems(),
        ],
      ),
    );
  }

  SizedBox _buildProfilePicture(BuildContext context) {
    return SizedBox(
          height: 120,
          width: 120,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              GetBuilder<ImagePickerService>(
                init: ImagePickerService(),
                builder: (controller) =>
                    const CircleAvatar(
                      child: Icon(Icons.person,size: 70,color: primaryColor,),
                      ),
              ),
              Positioned(
                bottom: 0,
                right: -18,
                child: SizedBox(
                  height: 42,
                  width: 58,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade300),
                      elevation: MaterialStateProperty.all<double>(0),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                    ),
                    onPressed: () {
                      imageController.takePictuer(context);
                    },
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black26,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
  }
}
