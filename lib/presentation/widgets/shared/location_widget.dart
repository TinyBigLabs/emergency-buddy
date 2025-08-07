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
    return kIsWeb? Row(
      children: [
        EntryIconWidget(icon: Icons.location_city),
        SizedBox(width: UIConstants.smallSize),
        Text(
          "Your Location is set to: $_location" ,
          style: kIsWeb? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
        SizedBox(height: UIConstants.smallSize),
      ],
    ) : Column(
      children: [
        kIsWeb? EntryIconWidget(icon: Icons.language) : SizedBox.shrink(),
        kIsWeb? SizedBox(width: UIConstants.smallSize) : SizedBox.shrink(),
        Text(
          kIsWeb? "Your Location is set to: $_location" : "Your Location is set to:" ,
          style: kIsWeb? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
        kIsWeb? SizedBox.shrink() : Text(
          _location,
          style: Theme.of(context).textTheme.bodyLarge,
          maxLines: 3,
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
        SizedBox(height: UIConstants.smallSize),
      ],
    );
  }
}
