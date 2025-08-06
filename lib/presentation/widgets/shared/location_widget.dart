import 'package:emergency_buddy/core/location/gps_location.dart';
import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/entry_icon_widget.dart';
import 'package:flutter/foundation.dart';
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
      setState(() {});
    }
  }

  @override
  initState() {
    super.initState();
    setLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: UIConstants.mediumSize),
      child: kIsWeb
          ? Text(
              "Your Location is set to: $_location",
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.visible,
              softWrap: true,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Your Location is set to: \n$_location",
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
                Text(
                  _location,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
                SizedBox(height: UIConstants.smallSize),
              ],
            ),
    );
  }
}
