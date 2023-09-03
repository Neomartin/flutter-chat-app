import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/input/input_field.dart';
import 'package:flutter_chat_app/components/welcome_buttons.dart';
import 'package:flutter_chat_app/pages/chat_screen.dart';

import '../constants/button_constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String id = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  Animation? animation2;
  int percent = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // upperBound: 100,
      // lowerBound: 50,
    );
    // animation = CurvedAnimation(
    //   parent: controller!,
    //   curve: Curves.decelerate,
    // );
    // animation2 = ColorTween(begin: Colors.indigo, end: Colors.lightBlueAccent)
    //     .animate(controller!);
    controller!.forward();
    // controller!.addStatusListener((status) {
    //   print(status);
    //   if (status == AnimationStatus.completed) controller!.reverse(from: 1.0);
    //   if (status == AnimationStatus.dismissed) controller!.forward();
    // });
    // controller!.addListener(() {
    //   percent = (controller!.value * 100).toInt();
    //   setState(() {});
    // });
  }

  String? email;
  String? password;
  @override
  dispose() {
    controller!.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      // ** Animation background color
      // backgroundColor: animation2!.value,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: 'logo',
                    child: Container(
                        width: 200, //controller!.value * 200,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: const Center(
                            child: Image(
                          image: AssetImage('assets/images/paw2.png'),
                        )))),
                InputField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  hintText: 'Ingrese su email',
                ),
                SizedBox(height: 16),
                InputField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    password = value;
                  },
                  hintText: 'Ingrese contraseña',
                ),
                SizedBox(height: 16),
                Center(
                  child: WelcomeScreenButton(
                    () async {
                      // print(email);
                      // print(password); // TODO: Register user with email
                      BuildContext ctx = context;
                      if (email != null && password != null) {
                        try {
                          await _auth.createUserWithEmailAndPassword(
                              email: email!, password: password!);
                          if (mounted) {
                            Navigator.pushNamed(ctx, ChatScreen.id);
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    'Registrarse',
                    const Icon(Icons.app_registration),
                    outlineStyle: kOutlineButtonColor,
                  ),
                  // ** Animation % text
                  // child: Text("$percent %", style: kLoginTitleScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
