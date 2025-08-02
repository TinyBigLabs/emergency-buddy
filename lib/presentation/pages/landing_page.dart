import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/first_aid/first_aid_listing.dart';
import 'package:emergency_buddy/presentation/widgets/footer_section/footer_section_sliver_mobile.dart';
import 'package:emergency_buddy/presentation/widgets/footer_section/footer_section_sliver_web.dart';
import 'package:emergency_buddy/presentation/widgets/header_section/header_section_sliver_mobile.dart';
import 'package:emergency_buddy/presentation/widgets/header_section/header_section_sliver_web.dart';
import 'package:emergency_buddy/presentation/widgets/hospitals/hospital_listing.dart';
import 'package:emergency_buddy/presentation/widgets/shared/custom_sliver_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emergency_buddy/presentation/widgets/first_aid/blocs/first_aid_cubit.dart';

class LandingPageSliver extends StatefulWidget {
  const LandingPageSliver({super.key, required this.title});

  final String title;

  @override
  State<LandingPageSliver> createState() => _LandingPageSliverState();
}

class _LandingPageSliverState extends State<LandingPageSliver> {
  late Future<void> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future to load data
    _loadDataFuture = context.read<FirstAidCubit>().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _loadDataFuture,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while data is being loaded
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if loading fails
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Show the appropriate home page once data is loaded
            return Stack(children: [
              CustomScrollView(slivers: [
                // Header with Language and GPS
                SliverPersistentHeader(
                  pinned: true, // Keeps the header pinned
                  delegate: CustomSliverAppBar(
                    title: widget.title,
                    content: kIsWeb
                        ? SliverTopBarWeb(title: widget.title)
                        : SliverTopBarMobile(title: widget.title),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(UIConstants.mediumSize),
                    child: Text(
                      'Nearby Hospitals',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                // Hospital section
                HospitalListing(),
                // First Aid Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(UIConstants.mediumSize),
                    child: Text(
                      'Life Threatening emergencies',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                FirstAidListing(category: 'Life Threatening'),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(UIConstants.mediumSize),
                    child: Text(
                      'Emergencies',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                FirstAidListing(category: 'Emergency'),
                // Bottom padding for fixed buttons
                SliverToBoxAdapter(
                  child: kIsWeb ? SizedBox(height: 100) : SizedBox(height: 50),
                ),
              ]),
              kIsWeb ? FooterSectionWeb() : FooterSectionMobile()
            ]);
          }
        },
      ),
    );
  }
}
