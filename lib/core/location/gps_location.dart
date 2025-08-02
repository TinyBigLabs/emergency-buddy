import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:developer';

class GPSLocation {
  Future<String> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return "Location services are disabled.";
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "Location permissions are denied.";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return "Location permissions are permanently denied.";
    }

    // Get the current position
    final position = await Geolocator.getCurrentPosition();

    //On Web: Detecting Geocoding not available, ignoring
    if (kIsWeb) {
      return "Lat: ${position.latitude}, Long: ${position.longitude}";
    }

    //On Mobile: Add the city for the coordinates:
    List<Placemark> placeMarks = [Placemark(name: "not found")];
    try {
      placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      log(e.toString());
    }
    return "${placeMarks.first.name}\nLat: ${position.latitude}\nLong: ${position.longitude}";
  }
}
