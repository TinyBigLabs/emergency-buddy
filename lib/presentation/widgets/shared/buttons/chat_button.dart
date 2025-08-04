import 'package:emergency_buddy/presentation/widgets/shared/buttons/action_button_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../chat/ui/chat_screen.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: Icons.chat_bubble,
      label: 'Chat',
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
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
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> EmergencyBuddyChatScreen())),
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
