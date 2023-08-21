import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final String? hintText;
  final double? width;
  final bool? dark;
  final Icon? icon;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  const InputField({
    required this.keyboardType,
    required this.onChanged,
    required this.hintText,
    this.width,
    this.dark,
    this.icon,
    this.textAlign,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widget.width ?? 0.7, //controller!.value * 200,
      child: TextField(
        obscureText: widget.keyboardType == TextInputType.visiblePassword,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign ?? TextAlign.center,
        onChanged: widget.onChanged,
        style: TextStyle(
          color: widget.dark == true ? Colors.white : Colors.black,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          icon: widget.icon,
          iconColor: widget.dark == true
              ? Colors.blueAccent
              : Colors.blueAccent.shade100,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.dark == true
                ? Colors.blueAccent.shade100.withOpacity(.5)
                : Colors.black,
          ),
          filled: true,
          fillColor: widget.dark == true ? Colors.white12 : Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.lightBlue.shade100, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
  }
}
