import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/text_constants.dart';

class ChatScreen extends StatelessWidget {
  static const String id = 'chat_screen';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: const Center(
        child: Text(
          'Chat',
          style: kLoginTitleScreen,
        ),
      ),
    );
  }
}
