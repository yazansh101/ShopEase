
import 'package:flutter/material.dart';

import '../../../core/services/location_service.dart';
import 'location_input.dart';

class AddAddress extends StatelessWidget {
   AddAddress({super.key});
  String? address;
  bool isGetLocationPressed =false;

  Future<String> getLocation() async {
    LocationService location = LocationService();
    return address = await location.getUserCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        LocationInput(),
        SizedBox(height: 15),
      ],
    );
  }
}
