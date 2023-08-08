import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/text_constants.dart';
import 'package:flutter_chat_app/pages/chat_screen.dart';
import 'package:flutter_chat_app/pages/login_screen.dart';
import 'package:flutter_chat_app/pages/register_screen.dart';
import 'package:flutter_chat_app/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData.light().copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.lightBlue.shade600,
              secondary: Colors.deepOrange,
            ),
        textTheme: Theme.of(context).textTheme.apply(
            // bodyColor: Colors.white,
            ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const Center(
        child: Text(
          'Hello, world!',
          style: kLoginTitleScreen,
        ),
      ),
    );
  }
}
