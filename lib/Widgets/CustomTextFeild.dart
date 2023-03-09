

import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final bool isDecorated;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validatorFunction;
  TextEditingController? textController;
  // final Function(String) function;
  bool autofocus;
  CustomTextField(
      {super.key,
        this.textController,
        this.validatorFunction,
        this.isDecorated = true,
        this.autofocus = true,
        // required this.function,
        this.keyboardType,
        required this.hint});

  @override

  Color statuscolor = Colors.blue.shade400;
  Widget build(BuildContext context) => Row(
    children: [
      const SizedBox(
        width: 32,
      ),
      Expanded(
        child: TextFormField(
          controller: textController,
          // onChanged: function,
          validator: validatorFunction,
          autofocus: autofocus,
          cursorColor: statuscolor,
          decoration: isDecorated
              ? InputDecoration(focusColor: statuscolor, hintText: hint)
              : InputDecoration(
              border: InputBorder.none,
              focusColor: statuscolor,
              hintText: hint),
        ),
      ),
      const SizedBox(
        width: 32,
      ),
    ],
  );
}
