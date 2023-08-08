import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/welcome_buttons.dart';
import 'package:flutter_chat_app/constants/text_constants.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: LayoutBuilder(
                builder: (context, contraints) => Container(
                  width: contraints.maxWidth * 0.6,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Center(
                    child: Image(
                      image: AssetImage('assets/images/paw2.png'),
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'Login',
              style: kLoginTitleScreen,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: WelcomeScreenButton(
                  () {}, 'Ingresar', const Icon(Icons.login)),
            ),
          ],
        ),
      ),
    );
  }
}
