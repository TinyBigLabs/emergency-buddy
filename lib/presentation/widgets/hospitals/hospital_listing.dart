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
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: hospitals.length,
          itemBuilder: (context, index) => _HospitalCard(hospital: hospitals[index]),
        ),
      ),
    );
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
