// ignore_for_file: avoid_print
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationService {

  Future<void> openMap() async {
    final position = await _getCurrentLocation();
    final long = position.longitude;
    final lat = position.latitude;
    String url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(url)
        ? await launchUrlString(url)
        : throw 'could not lunch url';
  }

  Future<String> getUserCurrentLocation() async {
    LocationPermission permission;
    bool serviceEnabled;

    permission = await Geolocator.checkPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final position = await _getCurrentLocation();
    final address =
        await _getAddressFromLatLng(position.latitude, position.longitude);
    return address;
  }

  Future<Position> _getCurrentLocation() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print(e);
    }
    return position!;
  }

  Future<String> _getAddressFromLatLng(
      double latitude, double longitude) async {
    String address = "";
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      address = "${place.locality}, ${place.country}";
    } catch (e) {
      print(e);
    }
    return address;
  }
}
