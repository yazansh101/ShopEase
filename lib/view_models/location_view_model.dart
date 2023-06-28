import 'dart:developer';

import 'package:get/get.dart';

import '../core/services/location_service.dart';

class LocationViewModel extends GetxController {
  String? previewImageUrl;
  String? address;
  bool isSetCurrentLocation = false;
  bool isLoading = false;
    LocationService location = LocationService();

  setCurrentLocation() {
    isSetCurrentLocation = true;
    isLoading = true;
    log('setCurrentLocation');
    update();
  }
  
  Future<void> openMap() async {
  location.openMap();
  }

  Future<void> getLocation() async {
    address = await location.getUserCurrentLocation();
    previewImageUrl='assets/images/snap_shot.png';
    //here I am using static snapshot
    isLoading = false;
    log('getLocation');
    update();
  }
}
