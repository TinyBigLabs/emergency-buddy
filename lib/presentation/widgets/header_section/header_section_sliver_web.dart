import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/call_button.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/chat_button.dart';
import 'package:emergency_buddy/presentation/widgets/shared/language_widget.dart';
import 'package:emergency_buddy/presentation/widgets/shared/location_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverTopBarWeb extends StatelessWidget {
  final String title;
  const SliverTopBarWeb({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(UIConstants.mediumSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LanguageWidget(),
                Text(" - ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                LocationWidget()
              ],
            ),
            SizedBox(height: 8.0), // Add some space between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CallButton(),
                SizedBox(width: 16.0), // Add space between buttons
                ChatButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
