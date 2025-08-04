import 'package:emergency_buddy/presentation/widgets/shared/buttons/action_button_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemma/core/message.dart';

import '../../../../domain/entities/emergency_message_model.dart';
import '../../chat/ui/chat_screen.dart';

class ChatButton extends StatelessWidget {
  final EmergencyMessageModel? message;
  const ChatButton({super.key, this.message});

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
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> EmergencyBuddyChatScreen(
                    supplementaryMessage: message == null ? null : Message(text: message!.toString(), isUser: false) ,
                  ))),
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
