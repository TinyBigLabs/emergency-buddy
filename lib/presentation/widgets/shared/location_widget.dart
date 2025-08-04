import 'package:emergency_buddy/core/location/gps_location.dart';
import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/entry_icon_widget.dart';
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
        EntryIconWidget(icon: Icons.gps_fixed),
        SizedBox(width: UIConstants.smallSize),
        Expanded(
          child: Text(
            "Location: $_location",
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.visible,
            softWrap: true,
          ),
        )
      ],
    );
  }
}
