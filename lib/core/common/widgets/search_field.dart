
import 'package:flutter/material.dart';
import 'package:technaureus_task/core/resources/color_res.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
  });
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
          borderSide: const BorderSide(
            color: Colors.black38,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        fillColor: Colors.white,
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 90,
          minWidth: 30
        ),        
        enabled: true,
        hintText: 'Search',
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: suffixIcon,
        suffixIconColor: Palette.primaryColor,
      ),
    );
  }
}
