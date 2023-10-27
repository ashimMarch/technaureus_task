import 'package:flutter/material.dart';
import 'package:technaureus_task/core/resources/color_res.dart';

class AppSnackBar {
  const AppSnackBar._();

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
      SnackBar(
        content: Text(message,style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold,
        ),),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Palette.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }
  static void loadingSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
      SnackBar(
        content: const LinearProgressIndicator(color: Palette.primaryColor,backgroundColor: Colors.white,),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        duration: const Duration(hours: 1),
      ),
    );
  }
  static void turnOFFLoadingSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}