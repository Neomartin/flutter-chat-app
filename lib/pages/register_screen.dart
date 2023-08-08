import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/text_constants.dart';

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
    animation2 = ColorTween(begin: Colors.indigo, end: Colors.lightBlueAccent)
        .animate(controller!);
    controller!.forward();
    controller!.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) controller!.reverse(from: 1.0);
      if (status == AnimationStatus.dismissed) controller!.forward();
    });
    controller!.addListener(() {
      percent = (controller!.value * 100).toInt();
      setState(() {});
    });
  }

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
      backgroundColor: animation2!.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
              tag: 'logo',
              child: Container(
                  width: controller!.value * 200,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Center(
                      child: Image(
                    image: AssetImage('assets/images/paw2.png'),
                  )))),
          Center(
            child: Text("$percent %", style: kLoginTitleScreen),
          ),
        ],
      ),
    );
  }
}
