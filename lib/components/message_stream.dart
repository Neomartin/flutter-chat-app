import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/chat_bubble.dart';

class MessageStream extends StatelessWidget {
  final FirebaseFirestore firestore;
  final String? userEmail;
  const MessageStream(this.firestore, this.userEmail, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore
          .collection('messages')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs;
        List<MessageBubbles> messageWidgets = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];
          final messageWidget = MessageBubbles(
              messageText: messageText,
              messageSender: messageSender,
              currentUserEmail: userEmail == messageSender);
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
