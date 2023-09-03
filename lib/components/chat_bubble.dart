import 'package:flutter/material.dart';

class MessageBubbles extends StatelessWidget {
  const MessageBubbles({
    super.key,
    required this.messageText,
    required this.messageSender,
    required this.currentUserEmail,
  });

  final String messageText;
  final String messageSender;
  final bool currentUserEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: currentUserEmail
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(messageSender,
              style: const TextStyle(color: Colors.white54, fontSize: 12.0)),
          Material(
            elevation: 5.0,
            color: currentUserEmail ? Colors.blueAccent : Colors.white38,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
