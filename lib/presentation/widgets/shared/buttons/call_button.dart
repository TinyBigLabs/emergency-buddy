import 'package:emergency_buddy/presentation/widgets/shared/buttons/action_button_template.dart';
import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.phone,
      label: 'Call SOS',
      backgroundColor: Theme.of(context).colorScheme.error,
      foregroundColor: Theme.of(context).colorScheme.onError,
      onTap: () {
        // Handle emergency call
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Emergency Call'),
              content: Text('Calling emergency services on 999...'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('CALL'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('CANCEL'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
