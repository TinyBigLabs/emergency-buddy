import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/shared/language_widget.dart';
import 'package:emergency_buddy/presentation/widgets/shared/location_widget.dart';
import 'package:flutter/material.dart';

class SliverTopBarMobile extends StatelessWidget {
  final String title;
  const SliverTopBarMobile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UIConstants.mediumSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [LanguageWidget(), LocationWidget()],
      ),
    );
  }
}
