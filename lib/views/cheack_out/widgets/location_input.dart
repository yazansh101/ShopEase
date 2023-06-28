import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../view_models/location_view_model.dart';
import 'location_button.dart';

class LocationInput extends StatefulWidget {
  // final Function onSelectPlace;

  const LocationInput({super.key}
      // this.onSelectPlace
      );

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  // String? _previewImageUrl;
  // String? address;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetBuilder(
        init: LocationViewModel(),
        builder: (locationViewModel) {
          log('build');
          log(locationViewModel.address.toString());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // _buildLocationPreview(),
              _buildLocationPreview(locationViewModel.previewImageUrl,
                  locationViewModel.isLoading),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                textAlign: TextAlign.center,
                text: locationViewModel.address ?? 'City',
                color: locationViewModel.address == null
                    ? Colors.grey
                    : primaryColor,
                fontSize: locationViewModel.address == null ? 12 : 15,
              ),

              const SizedBox(
                height: 15,
              ),
              if (locationViewModel.address == null)
                _buildLocationButtons(locationViewModel.setCurrentLocation,
                    locationViewModel.getLocation, locationViewModel.openMap),
            ],
          );
        });
  }

  Container _buildLocationPreview(previewImageUrl, bool isLoading) {
    return Container(
      height: SizeConfig.screenHeight * 0.22,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: primaryColor),
        borderRadius: BorderRadiusDirectional.circular(5),
      ),
      child: previewImageUrl == null && !isLoading
          ? CustomText(
              text: 'No Location Chosen',
              alignment: Alignment.center,
            )
          : isLoading
              ? const Center(child: CircularProgressIndicator())
              : Image.asset(
                  previewImageUrl!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
    );
  }

  _buildLocationButtons(
      void Function() setCurrentUserLocation, getLocation, openMap) {
    return Row(
      children: [
        LocationButton(
          onTap: () async {
            setCurrentUserLocation();
            await getLocation();
          },
          icon: const Icon(
            Icons.location_on,
            color: Colors.green,
          ),
          text: 'Current Location',
        ),
        LocationButton(
          onTap: () async {
            setCurrentUserLocation();
            await openMap();
          },
          icon: const Icon(
            Icons.map,
            color: Colors.green,
          ),
          text: 'Open in map',
        ),
      ],
    );
  }
}
