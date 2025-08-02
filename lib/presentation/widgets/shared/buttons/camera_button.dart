import 'package:emergency_buddy/presentation/widgets/shared/buttons/action_button_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.camera,
      label: 'Camera',
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      onTap: () {
        // Handle camera action
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Camera'),
              content: Text('Opening camera...'),
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
