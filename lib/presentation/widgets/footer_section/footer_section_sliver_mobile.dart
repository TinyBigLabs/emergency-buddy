import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/call_button.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/camera_button.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/chat_button.dart';
import 'package:flutter/material.dart';

class FooterSectionMobile extends StatelessWidget {
  const FooterSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return // Fixed Bottom Action Buttons
        Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        margin: EdgeInsets.all(UIConstants.mediumSize),
        padding: EdgeInsets.all(UIConstants.mediumSize),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.all(
            Radius.circular(UIConstants.largeSize),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withAlpha(80),
              blurRadius: 12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ChatButton(), CallButton(), CameraButton()],
        ),
      ),
    );
  }
}
