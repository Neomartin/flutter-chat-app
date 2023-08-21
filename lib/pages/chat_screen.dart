import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/input/input_field.dart';
import 'package:flutter_chat_app/components/message_stream.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User? user;
  @override
  void initState() {
    super.initState();
    try {
      user = _auth.currentUser;
      print(user);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    String message = '';
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Chat Screen'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MessageStream(firestore),
                    ],
                  ),
                )),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InputField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        message = value;
                      },
                      hintText: 'Ingrese su mensaje',
                      width: 1,
                      dark: true,
                      icon: const Icon(Icons.message),
                      textAlign: TextAlign.start,
                      controller: messageController,
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    firestore.collection('messages').add({
                      'text': message,
                      'sender': user!.email,
                      'date': DateTime.now()
                    });
                    messageController.clear();
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
