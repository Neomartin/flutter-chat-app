import 'package:flutter/material.dart';

class WelcomeScreenButton extends StatelessWidget {
  final Function() onPressed;
  final String btnText;
  final Icon icon;
  final ButtonStyle? outlineStyle;
  const WelcomeScreenButton(this.onPressed, this.btnText, this.icon,
      {this.outlineStyle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: outlineStyle,
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(btnText),
          ],
        ),
      ),
    );
  }
}
