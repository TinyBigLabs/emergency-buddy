import 'dart:math';

import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/first_aid/first_aid_listing.dart';
import 'package:emergency_buddy/presentation/widgets/footer_section/footer_section_sliver_mobile.dart';
import 'package:emergency_buddy/presentation/widgets/footer_section/footer_section_sliver_web.dart';
import 'package:emergency_buddy/presentation/widgets/gemma/gemma_loading_widget.dart';
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
  // State for toggle buttons
  final List<bool> _isSelected = [true, false, false];

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
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding: EdgeInsets.all(UIConstants.mediumSize),
                //     child: GemmaLoadingWidget(),
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(UIConstants.mediumSize),
                    child: Text(
                      'Nearby Safe Zones',
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
                      'First Aid',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(UIConstants.mediumSize),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Select an age group to view first aid instructions',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(height: UIConstants.mediumSize),
                          ToggleButtons(
                            isSelected: _isSelected,
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0; i < _isSelected.length; i++) {
                                  _isSelected[i] = i == index;
                                }
                                index == 0
                                    ? context.read<FirstAidCubit>().setAgeGroup("adult")
                                    : index == 1
                                        ? context.read<FirstAidCubit>().setAgeGroup("child")
                                        : context.read<FirstAidCubit>().setAgeGroup("baby");
                              });
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            selectedColor: Colors.white,
                            fillColor: Theme.of(context).primaryColorDark,
                            color: Colors.black,
                            constraints: BoxConstraints.expand(
                              width: MediaQuery.of(context).size.width * 0.9 / _isSelected.length,
                            ),
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.person),
                                  Text('Adult'),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.child_care),
                                  Text('Child'),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.baby_changing_station),
                                  Text('Baby'),
                                ],
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(UIConstants.mediumSize),
                        child: Text(
                          'Life Threatening',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ),
                FirstAidListing(category: 'Life Threatening'),
                SliverToBoxAdapter(
                  child: Container(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(UIConstants.mediumSize),
                        child: Text(
                          'Emergencies',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
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
