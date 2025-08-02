import 'package:emergency_buddy/presentation/widgets/shared/buttons/action_button_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.chat_bubble,
      label: 'Chat',
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      onTap: () {
        // Handle camera action
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Chat'),
              content: Text('Opening chat...'),
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
