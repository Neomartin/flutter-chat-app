import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/welcome_buttons.dart';
import 'package:flutter_chat_app/constants/button_constants.dart';
import 'package:flutter_chat_app/constants/text_constants.dart';
import 'package:flutter_chat_app/pages/login_screen.dart';
import 'package:flutter_chat_app/pages/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: LayoutBuilder(
                  builder: (context, contraints) => Container(
                    width: contraints.maxWidth * 0.25,
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
                        'Welcome to Paw Chat!!',
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
              ),
              WelcomeScreenButton(() {
                Navigator.pushNamed(context, LoginScreen.id);
              }, 'Ingresar', const Icon(Icons.login)),
              WelcomeScreenButton(
                () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                'Registrarse',
                const Icon(Icons.app_registration),
                outlineStyle: kOutlineButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
