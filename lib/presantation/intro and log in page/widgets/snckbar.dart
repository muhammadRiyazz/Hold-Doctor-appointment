import 'package:appoiment_docter/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:toasty_snackbar/toasty_snackbar.dart';

showSnakbar(String? msg, context) {
  final snakbar = SnackBar(
      //  backgroundColor: Color.fromARGB(0, 255, 193, 7),
      duration: const Duration(seconds: 5),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(msg!),
      ));
  ScaffoldMessenger.of(context).showSnackBar(snakbar);
}
