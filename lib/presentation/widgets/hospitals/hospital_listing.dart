import 'dart:math';

import 'package:flutter/material.dart';
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
    required this.userLocation,
    this.searchRadiusKm = 5.0, // Default search radius
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

    _nearbyPlacesFuture = GetIt.instance<LocationSearchRepo>().findNearby(
      widget.userLocation,
      widget.searchRadiusKm,
    );
  }

  // Helper function to get the correct icon for the location type.
  IconData _getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'hospital':
        return Icons.local_hospital;
      case 'police station':
        return Icons.local_police;
      case 'transport hub':
        return Icons.train;
      default:
        return Icons.place;
    }
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
      child: 
          SizedBox(
            height: 180,
   
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
                  return const Center(
                      child: Text("No locations found nearby."));
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
                    return Container(
                      width: 280,
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                      _getIconForType(
                                          place.type), // Dynamic icon
                                      color: Colors.red[600],
                                      size: 24),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      place.name, // Data from our service
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.grey[600], size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${distance.toStringAsFixed(1)} km away', // Live distance
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.phone,
                                      color: Colors.grey[600], size: 16),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      place.details.phone,
                                        // Data from our service
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
    );
  }
}
