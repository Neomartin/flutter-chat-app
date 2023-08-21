import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/welcome_buttons.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../components/input/input_field.dart';
import '../constants/button_constants.dart';
import '../constants/text_constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: LayoutBuilder(
                  builder: (context, contraints) => Container(
                    width: contraints.maxWidth * 0.5,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Center(
                      child: Image(
                        image: AssetImage('assets/images/paw2.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin: const EdgeInsets.only(bottom: 20),
                child: DefaultTextStyle(
                  style: kLoginTitleScreen.copyWith(color: Colors.black),
                  child: AnimatedTextKit(
                    repeatForever: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Login to Paw Chat!!',
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
              ),
              InputField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                hintText: 'Ingrese su email',
              ),
              const SizedBox(height: 16),
              InputField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  password = value;
                },
                hintText: 'Ingrese contraseña',
              ),
              const SizedBox(height: 10),
              Center(
                child: WelcomeScreenButton(
                  () async {
                    EasyLoading.show(
                      status: 'Ingresando...',
                      indicator: const CircularProgressIndicator(
                        color: Colors.lightBlue,
                      ),
                      maskType: EasyLoadingMaskType.none,
                    );
                    // print(email);
                    // print(password); // TODO: Register user with email
                    if (email != null && password != null) {
                      try {
                        await _auth.signInWithEmailAndPassword(
                            email: email!, password: password!);
                        // if (mounted) {
                        Navigator.pushNamed(context, ChatScreen.id);
                        // }
                      } catch (e) {
                        print(e);
                      } finally {
                        EasyLoading.dismiss();
                      }
                    }
                  },
                  'Ingresar',
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
    );
  }
}
