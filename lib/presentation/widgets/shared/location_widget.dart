import 'package:emergency_buddy/core/location/gps_location.dart';
import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String _location = "Fetching location...";

  Future<void> setLocation() async {
    try {
      _location = await GPSLocation().getLocation();
      setState(() {});
    } catch (e) {
      _location = "Failed to fetch location: $e";
    }
  }

  @override
  initState() {
    super.initState();
    setLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.gps_fixed, color: Colors.white, size: 20),
        SizedBox(width: UIConstants.smallSize),
        Text(
          "Location: $_location",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
