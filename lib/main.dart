import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/chat_screen.dart';
import 'package:flutter_chat_app/pages/login_screen.dart';
import 'package:flutter_chat_app/pages/register_screen.dart';
import 'package:flutter_chat_app/pages/welcome_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.lightBlue
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.lightBlue
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
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
      builder: EasyLoading.init(),
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
