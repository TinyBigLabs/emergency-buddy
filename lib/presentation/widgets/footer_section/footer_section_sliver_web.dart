import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:flutter/material.dart';

class FooterSectionWeb extends StatelessWidget {
  const FooterSectionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return // Fixed Bottom Action Buttons
        Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(UIConstants.mediumSize),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              "CopyRight © 2025 Emergency Buddy",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ]),
        ),
      ),
    );
  }
}
