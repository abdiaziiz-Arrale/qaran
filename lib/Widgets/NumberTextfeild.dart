import 'package:flutter/material.dart';



class NumbersTextField extends StatelessWidget {
  bool isDecorated;
  final String hint;
  final TextInputType? keyboardType;
 final textController;
  // final Function(String) function;
  bool autofocus;
  NumbersTextField(
      {super.key,
        this.textController,
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
        child: TextField(
          controller: textController,
          // onChanged: function,
          keyboardType: TextInputType.phone,
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
