import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/knowledge_base_model.dart';
import '../../../domain/repositories/location_search_repo.dart';

// Data Models
class Hospital {
  final String name;
  final String distance;
  final String phone;
  final String beds;

  Hospital(this.name, this.distance, this.phone, this.beds);
}

// The old 'Hospital' data class is no longer needed.

// We've converted your widget to a StatefulWidget to handle the data loading.
class HospitalListing extends StatefulWidget {
  // We need to know the user's location to find what's nearby.
  final Point userLocation;
  final double searchRadiusKm;

  const HospitalListing({
    super.key,
    this.userLocation = const Point(-0.13311838933852876, 51.52776224324315),
    this.searchRadiusKm = 10.0, // Default search radius
  });

  @override
  State<HospitalListing> createState() => _HospitalListingState();
}

class _HospitalListingState extends State<HospitalListing> {
  // A FutureBuilder is the best way to handle data that needs to be loaded.
  late final Future<List<KnowledgeBaseElement>> _nearbyPlacesFuture;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    // We fetch the data once when the widget is first created.
   _nearbyPlacesFuture = _fetchNearbyPlaces();
  }

   Future<List<KnowledgeBaseElement>>  _fetchNearbyPlaces() async {
    // We're using the GetIt service locator to get the LocationSearchRepo.
    return Geolocator.getCurrentPosition().then((position) =>
   
     GetIt.instance<LocationSearchRepo>().findNearby(
      kIsWeb ? widget.userLocation : Point(position.longitude, position.latitude),
      widget.searchRadiusKm,
    ));
  }


  // Helper to calculate distance for display.
  double _getDistance(Point userLocation, Point placeLocation) {
    const R = 6371.0; // Earth radius in kilometers
    final dLat = (placeLocation.y - userLocation.y) * (pi / 180.0);
    final dLon = (placeLocation.x - userLocation.x) * (pi / 180.0);
    final lat1 = userLocation.y * (pi / 180.0);
    final lat2 = placeLocation.y * (pi / 180.0);

    final a =
        pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(lat1) * cos(lat2);
    final c = 2 * asin(sqrt(a));
    return R * c;
  }

  @override
  Widget build(BuildContext context) {
    // The UI structure is identical to yours, just wrapped in a FutureBuilder.
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: FutureBuilder<List<KnowledgeBaseElement>>(
          future: _nearbyPlacesFuture,
          builder: (context, snapshot) {
            // Handle loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // Handle error state
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            // Handle empty state
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No locations found nearby."));
            }

            // If we have data, we build the same list you designed.
            final locations = snapshot.data!;

            return ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final place = locations[index];
                final distance = _getDistance(widget.userLocation,
                    Point(place.location.lon, place.location.lat));

                // This is your exact card layout, but with dynamic data.
                return _HospitalCard(hospital: Hospital(place.name,   '${distance.toStringAsFixed(1)} km away',   place.details.phone, ""));
                
             
              },
            );
          })));
  }
}

class _HospitalCard extends StatelessWidget {
  final Hospital hospital;
  const _HospitalCard({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardHeadingWidget(hospital: hospital),
                const SizedBox(height: 12),
                Row(
                  children: [
                    EntryIconWidget(icon: Icons.location_on),
                    const SizedBox(width: 4),
                    Text(hospital.distance, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    EntryIconWidget(icon: Icons.phone),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(hospital.phone, style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
                Spacer(),
                ActionButtonsWidget(
                  onCall: () {
                    // Implement call functionality
                  },
                  onLocate: () {
                    // Implement locate functionality
                  },
                  onInfo: () {
                    // Implement info functionality
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButtonsWidget extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onLocate;
  final VoidCallback onInfo;

  const ActionButtonsWidget(
      {super.key, required this.onCall, required this.onLocate, required this.onInfo});

  @override
  Widget build(BuildContext context) {
    final BorderRadius leftRadius = const BorderRadius.only(
      topLeft: Radius.circular(24),
      bottomLeft: Radius.circular(24),
    );
    final BorderRadius rightRadius = const BorderRadius.only(
      topRight: Radius.circular(24),
      bottomRight: Radius.circular(24),
    );
    final BorderRadius centerRadius = BorderRadius.circular(4.0);

    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: leftRadius,
            ),
          ),
          onPressed: onCall,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.phone)),
              Text('Call', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: centerRadius,
            ),
          ),
          onPressed: onLocate,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.location_on)),
              Text('Locate', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(borderRadius: rightRadius),
          ),
          onPressed: onInfo,
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.info)),
              Text('Info', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class CardHeadingWidget extends StatelessWidget {
  const CardHeadingWidget({
    super.key,
    required this.hospital,
  });

  final Hospital hospital;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 2.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.errorContainer,
          ),
          child: Icon(
            Icons.local_hospital,
            size: 32.0,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            hospital.name,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class EntryIconWidget extends StatelessWidget {
  final IconData icon;
  final double size;

  const EntryIconWidget({
    super.key,
    required this.icon,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 2.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Icon(icon, size: size));
  }
}
