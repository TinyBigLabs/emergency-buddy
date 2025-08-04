import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemma/core/message.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';
import 'widgets/chat_widget.dart';

class EmergencyBuddyChatScreen extends StatefulWidget {
  final Message? supplementaryMessage;
  const EmergencyBuddyChatScreen({super.key,  this.supplementaryMessage});

  @override
  State<EmergencyBuddyChatScreen> createState() =>
      _EmergencyBuddyChatScreenState();
}

class _EmergencyBuddyChatScreenState extends State<EmergencyBuddyChatScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  Uint8List? _selectedImage;
  bool _hasAlreadySentSupplementaryMessage = false;
  final _textController = TextEditingController();

  void _sendMessage(bool isResponding) {
    if (isResponding) return;
    final text = _textController.text.trim();
    if (text.isEmpty && _selectedImage == null) return;

    context
        .read<ChatBloc>()
        .add(SendMessageEvent(text: text, image: _selectedImage));

    _textController.clear();
    setState(() {
      _selectedImage = null;
    });
    FocusScope.of(context).unfocus();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _selectedImage = bytes;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image selection error: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
    context.read<ChatBloc>().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Buddy'), ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          if (state is ChatInitial || state is ChatModelLoading) {
            return Center(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(24),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 24),
                      Text(
                        state is ChatModelLoading
                            ? state.message
                            : 'Initializing...',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (state is ChatModelLoading && state.progress != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: LinearProgressIndicator(value: state.progress),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }

          if (state is ChatReady) {
            if (widget.supplementaryMessage != null && !_hasAlreadySentSupplementaryMessage){
            context.read<ChatBloc>().add(SendMessageEvent(
                text: widget.supplementaryMessage!.text,
                image: widget.supplementaryMessage!.imageBytes));
                _hasAlreadySentSupplementaryMessage = true;
            }
            
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages.reversed.toList()[index];
                      return ChatMessageWidget(message: message);
                    },
                  ),
                ),
                state.isResponding
                    ? const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            SizedBox.square(
                                dimension: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2.5)),
                            SizedBox(width: 12),
                            Text('Emergency Buddy is thinking...'),
                          ],
                        ))
                    : SizedBox.shrink(),
                _buildChatInputArea(state.isResponding),
              ],
            );
          }
          return Center(
              child: Text("An error occurred. Please restart the app."));
        },
      ),
    );
  }

  Widget _buildChatInputArea(bool isResponding) {
    // This is a more complete version of your input area
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_selectedImage != null)
                Align(
                  alignment: Alignment.centerLeft,
                child:
                Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: 
                 Image.memory(
                  _selectedImage!,
                  height: 100,
                ))),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Ask for help...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onSubmitted: (_) => _sendMessage(isResponding),
                    ),
                  ),
                  if (!kIsWeb) ...[
                    IconButton(
                      icon: const Icon(Icons.photo),
                      onPressed: _pickImage,
                    ),
                  ],
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed:
                        isResponding ? null : () => _sendMessage(isResponding),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
