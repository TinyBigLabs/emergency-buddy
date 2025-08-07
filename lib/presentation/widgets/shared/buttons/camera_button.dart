import 'package:emergency_buddy/presentation/widgets/shared/buttons/action_button_template.dart';
import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.camera_alt,
      label: 'Camera',
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      onTap: () {
        // Handle camera action
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Camera'),
              content: Text('Opening camera - take a photo to upload to be analysed with this category.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
