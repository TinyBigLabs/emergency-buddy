import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GemmaChallengeDisclaimer extends StatelessWidget {
  const GemmaChallengeDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
                "This is an accompanying, lite deployment of the \"Emergency Buddy\" mobile app submitted during the Hackathon:  \"Google - The Gemma 3n Impact Challenge\".\nThis site is not intended to be used as fully working application",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        )
        : SizedBox.shrink();
  }
}
