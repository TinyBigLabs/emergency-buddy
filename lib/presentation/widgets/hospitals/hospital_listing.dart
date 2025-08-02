import 'package:flutter/material.dart';

// Data Models
class Hospital {
  final String name;
  final String distance;
  final String phone;
  final String beds;

  Hospital(this.name, this.distance, this.phone, this.beds);
}

class HospitalListing extends StatelessWidget {
  HospitalListing({super.key});

  final List<Hospital> hospitals = [
    Hospital('Royal Surrey County Hospital', '2.1 km', '+44 1483 571122', ''),
    Hospital('Frimley Park Hospital', '4.8 km', '+44 1276 604604', 'Limited'),
    Hospital('St Peter\'s Hospital', '6.2 km', '+44 1932 872000', 'Available'),
    Hospital('Ashford Hospital', '8.5 km', '+44 1784 884488', 'Full'),
  ];

  @override
  Widget build(BuildContext context) {
    return // Hospital Carousel
        SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                final hospital = hospitals[index];
                return Container(
                  width: 280,
                  margin: EdgeInsets.only(right: 16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.local_hospital,
                                  color: Colors.red[600], size: 24),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  hospital.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.grey[600], size: 16),
                              SizedBox(width: 4),
                              Text(
                                hospital.distance,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.phone,
                                  color: Colors.grey[600], size: 16),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  hospital.phone,
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
            ),
          ),
        ],
      ),
    );
  }
}
