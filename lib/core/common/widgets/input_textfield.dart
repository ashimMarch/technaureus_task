
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    this.controller,
    this.labelText,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45)
        ),
        contentPadding: const EdgeInsets.all(10),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black45),
      ),
      cursorColor: Colors.black,
    );
  }
}