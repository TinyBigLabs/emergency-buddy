import 'package:emergency_buddy/presentation/widgets/chat/bloc/chat_bloc.dart';
import 'package:emergency_buddy/presentation/widgets/chat/bloc/chat_state.dart';
import 'package:emergency_buddy/presentation/widgets/chat/ui/first_aid_chat_screen.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/action_button_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstAidChatScreen() ,
        ));
      },
    );
  }
}
